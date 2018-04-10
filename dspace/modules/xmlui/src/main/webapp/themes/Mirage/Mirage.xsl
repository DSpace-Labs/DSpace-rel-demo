<?xml version="1.0" encoding="UTF-8"?>
<!--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

-->
<!--
    TODO: Describe this XSL file
    Author: Alexey Maslov

-->

<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:dri="http://di.tamu.edu/DRI/1.0/"
	xmlns:mets="http://www.loc.gov/METS/"
	xmlns:xlink="http://www.w3.org/TR/xlink/"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:mods="http://www.loc.gov/mods/v3"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns="http://www.w3.org/1999/xhtml"
    xmlns:util="org.dspace.app.xmlui.utils.XSLUtils"
	exclude-result-prefixes="i18n dri mets xlink xsl dim xhtml mods dc">

    <xsl:import href="../dri2xhtml-alt/dri2xhtml.xsl"/>
    <xsl:import href="lib/xsl/core/global-variables.xsl"/>
    <xsl:import href="lib/xsl/core/page-structure.xsl"/>
    <xsl:import href="lib/xsl/core/navigation.xsl"/>
    <xsl:import href="lib/xsl/core/elements.xsl"/>
    <xsl:import href="lib/xsl/core/forms.xsl"/>
    <xsl:import href="lib/xsl/core/attribute-handlers.xsl"/>
    <xsl:import href="lib/xsl/core/utils.xsl"/>
    <xsl:import href="lib/xsl/aspect/general/choice-authority-control.xsl"/>
    <xsl:import href="lib/xsl/aspect/administrative/administrative.xsl"/>
    <xsl:import href="lib/xsl/aspect/artifactbrowser/item-list.xsl"/>
    <xsl:import href="lib/xsl/aspect/artifactbrowser/item-view.xsl"/>
    <xsl:import href="lib/xsl/aspect/artifactbrowser/community-list.xsl"/>
    <xsl:import href="lib/xsl/aspect/artifactbrowser/collection-list.xsl"/>
    <xsl:output indent="yes"/>
    
    <xsl:template name="itemSummaryView-DIM-fields">
      <xsl:param name="clause" select="'1'"/>
      <xsl:param name="phase" select="'even'"/>
      <xsl:variable name="otherPhase">
            <xsl:choose>
              <xsl:when test="$phase = 'even'">
                <xsl:text>odd</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>even</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
      </xsl:variable>

      <xsl:choose>
          <!-- Title row -->
          <xsl:when test="$clause = 1">

              <xsl:choose>
                  <xsl:when test="descendant::text() and (count(dim:field[@element='title'][not(@qualifier)]) &gt; 1)">
                      <!-- display first title as h1 -->
                      <h1>
                          <xsl:value-of select="dim:field[@element='title'][not(@qualifier)][1]/node()"/>
                      </h1>
                      <div class="simple-item-view-other">
                          <span class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-title</i18n:text>:</span>
                          <span>
                              <xsl:for-each select="dim:field[@element='title'][not(@qualifier)]">
                                  <xsl:value-of select="./node()"/>
                                  <xsl:if test="count(following-sibling::dim:field[@element='title'][not(@qualifier)]) != 0">
                                      <xsl:text>; </xsl:text>
                                      <br/>
                                  </xsl:if>
                              </xsl:for-each>
                          </span>
                      </div>
                  </xsl:when>
                  <xsl:when test="dim:field[@element='title'][descendant::text()] and count(dim:field[@element='title'][not(@qualifier)]) = 1">
                      <h1>
                          <xsl:value-of select="dim:field[@element='title'][not(@qualifier)][1]/node()"/>
                      </h1>
                  </xsl:when>
                  <xsl:otherwise>
                      <h1>
                          <i18n:text>xmlui.dri2xhtml.METS-1.0.no-title</i18n:text>
                      </h1>
                  </xsl:otherwise>
              </xsl:choose>
            <xsl:call-template name="itemSummaryView-DIM-fields">
              <xsl:with-param name="clause" select="($clause + 1)"/>
              <xsl:with-param name="phase" select="$otherPhase"/>
            </xsl:call-template>
          </xsl:when>

          <!-- Author(s) row -->
          <xsl:when test="$clause = 2 and (dim:field[@element='contributor'][@qualifier='author' and descendant::text()] or dim:field[@element='creator' and descendant::text()] or dim:field[@element='contributor' and descendant::text()])">
                    <div class="simple-item-view-authors">
	                    <xsl:choose>
	                        <xsl:when test="dim:field[@element='contributor'][@qualifier='author']">
	                            <xsl:for-each select="dim:field[@element='contributor'][@qualifier='author']">
                                        <span>
                                          <xsl:if test="@authority">
                                            <xsl:attribute name="class"><xsl:text>ds-dc_contributor_author-authority</xsl:text></xsl:attribute>
                                          </xsl:if>
	                                <xsl:copy-of select="node()"/>
                                        </span>
	                                <xsl:if test="count(following-sibling::dim:field[@element='contributor'][@qualifier='author']) != 0">
	                                    <xsl:text>; </xsl:text>
	                                </xsl:if>
	                            </xsl:for-each>
	                        </xsl:when>
	                        <xsl:when test="dim:field[@element='creator']">
	                            <xsl:for-each select="dim:field[@element='creator']">
	                                <xsl:copy-of select="node()"/>
	                                <xsl:if test="count(following-sibling::dim:field[@element='creator']) != 0">
	                                    <xsl:text>; </xsl:text>
	                                </xsl:if>
	                            </xsl:for-each>
	                        </xsl:when>
	                        <xsl:when test="dim:field[@element='contributor']">
	                            <xsl:for-each select="dim:field[@element='contributor']">
	                                <xsl:copy-of select="node()"/>
	                                <xsl:if test="count(following-sibling::dim:field[@element='contributor']) != 0">
	                                    <xsl:text>; </xsl:text>
	                                </xsl:if>
	                            </xsl:for-each>
	                        </xsl:when>
	                        <xsl:otherwise>
	                            <i18n:text>xmlui.dri2xhtml.METS-1.0.no-author</i18n:text>
	                        </xsl:otherwise>
	                    </xsl:choose>
	            </div>
              <xsl:call-template name="itemSummaryView-DIM-fields">
                <xsl:with-param name="clause" select="($clause + 1)"/>
                <xsl:with-param name="phase" select="$otherPhase"/>
              </xsl:call-template>
          </xsl:when>

          <!-- identifier.uri row -->
          <xsl:when test="$clause = 3 and (dim:field[@element='identifier' and @qualifier='uri' and descendant::text()])">
                    <div class="simple-item-view-other">
	                <span class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-uri</i18n:text>:</span>
	                <span>
	                	<xsl:for-each select="dim:field[@element='identifier' and @qualifier='uri']">
		                    <a>
		                        <xsl:attribute name="href">
		                            <xsl:copy-of select="./node()"/>
		                        </xsl:attribute>
		                        <xsl:copy-of select="./node()"/>
		                    </a>
		                    <xsl:if test="count(following-sibling::dim:field[@element='identifier' and @qualifier='uri']) != 0">
		                    	<br/>
		                    </xsl:if>
	                    </xsl:for-each>
	                </span>
	            </div>
              <xsl:call-template name="itemSummaryView-DIM-fields">
                <xsl:with-param name="clause" select="($clause + 1)"/>
                <xsl:with-param name="phase" select="$otherPhase"/>
              </xsl:call-template>
          </xsl:when>

          <!-- date.issued row -->
          <xsl:when test="$clause = 4 and (dim:field[@element='date' and @qualifier='issued' and descendant::text()])">
                    <div class="simple-item-view-other">
	                <span class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-date</i18n:text>:</span>
	                <span>
		                <xsl:for-each select="dim:field[@element='date' and @qualifier='issued']">
		                	<xsl:copy-of select="substring(./node(),1,10)"/>
		                	 <xsl:if test="count(following-sibling::dim:field[@element='date' and @qualifier='issued']) != 0">
	                    	<br/>
	                    </xsl:if>
		                </xsl:for-each>
	                </span>
	            </div>
              <xsl:call-template name="itemSummaryView-DIM-fields">
                <xsl:with-param name="clause" select="($clause + 1)"/>
                <xsl:with-param name="phase" select="$otherPhase"/>
              </xsl:call-template>
          </xsl:when>

          <!-- Abstract row -->
          <xsl:when test="$clause = 5 and (dim:field[@element='description' and @qualifier='abstract' and descendant::text()])">
                    <div class="simple-item-view-description">
	                <h3><i18n:text>xmlui.dri2xhtml.METS-1.0.item-abstract</i18n:text>:</h3>
	                <div>
	                <xsl:if test="count(dim:field[@element='description' and @qualifier='abstract']) &gt; 1">
	                	<div class="spacer">&#160;</div>
	                </xsl:if>
	                <xsl:for-each select="dim:field[@element='description' and @qualifier='abstract']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:copy-of select="node()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>&#160;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="count(following-sibling::dim:field[@element='description' and @qualifier='abstract']) != 0">
                            <div class="spacer">&#160;</div>
	                    </xsl:if>
	              	</xsl:for-each>
	              	<xsl:if test="count(dim:field[@element='description' and @qualifier='abstract']) &gt; 1">
                          <div class="spacer">&#160;</div>
	                </xsl:if>
	                </div>
	            </div>
              <xsl:call-template name="itemSummaryView-DIM-fields">
                <xsl:with-param name="clause" select="($clause + 1)"/>
                <xsl:with-param name="phase" select="$otherPhase"/>
              </xsl:call-template>
          </xsl:when>

          <!-- Description row -->
          <xsl:when test="$clause = 6 and (dim:field[@element='description' and not(@qualifier) and descendant::text()])">
                <div class="simple-item-view-description">
	                <h3 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-description</i18n:text>:</h3>
	                <div>
	                <xsl:if test="count(dim:field[@element='description' and not(@qualifier)]) &gt; 1 and not(count(dim:field[@element='description' and @qualifier='abstract']) &gt; 1)">
                        <div class="spacer">&#160;</div>
	                </xsl:if>
	                <xsl:for-each select="dim:field[@element='description' and not(@qualifier)]">
		                <xsl:copy-of select="./node()"/>
		                <xsl:if test="count(following-sibling::dim:field[@element='description' and not(@qualifier)]) != 0">
                            <div class="spacer">&#160;</div>
	                    </xsl:if>
	               	</xsl:for-each>
	               	<xsl:if test="count(dim:field[@element='description' and not(@qualifier)]) &gt; 1">
                           <div class="spacer">&#160;</div>
	                </xsl:if>
	                </div>
	            </div>
              <xsl:call-template name="itemSummaryView-DIM-fields">
                <xsl:with-param name="clause" select="($clause + 1)"/>
                <xsl:with-param name="phase" select="$otherPhase"/>
              </xsl:call-template>
          </xsl:when>

          <!-- MAKING DSPACE YOUR OWN WEBINAR START-->
          <xsl:when test="$clause = 7 and (dim:field[@element='subject' and descendant::text()])">
              <div class="simple-item-view-other">
                  <span class="bold">Subjects:</span>
                  <span>
                      <xsl:for-each select="dim:field[@element='subject']">
                          <xsl:copy-of select="./node()"/>
                          <xsl:if test="count(following-sibling::dim:field[@element='subject']) != 0">
                              <xsl:text>;</xsl:text>
                           </xsl:if>
                       </xsl:for-each>
                  </span>
              </div>
              <xsl:call-template name="itemSummaryView-DIM-fields">
                  <xsl:with-param name="clause" select="($clause + 1)"/>
                  <xsl:with-param name="phase" select="$otherPhase"/>
              </xsl:call-template>
          </xsl:when>

          <xsl:when test="$clause = 8 and (dim:field[@element='type' and descendant::text()])">
              <div class="simple-item-view-other">
                  <span class="bold">Types:</span>
                  <span>
                      <xsl:for-each select="dim:field[@element='type']">
                          <xsl:copy-of select="./node()"/>
                          <xsl:if test="count(following-sibling::dim:field[@element='type']) != 0">
                              <xsl:text>;</xsl:text>
                           </xsl:if>
                       </xsl:for-each>
                  </span>
              </div>
              <xsl:call-template name="itemSummaryView-DIM-fields">
                  <xsl:with-param name="clause" select="($clause + 1)"/>
                  <xsl:with-param name="phase" select="$otherPhase"/>
              </xsl:call-template>
          </xsl:when>
          <!-- MAKING DSPACE YOUR OWN WEBINAR END-->

          <xsl:when test="$clause = 9 and $ds_item_view_toggle_url != ''">
              <p class="ds-paragraph item-view-toggle item-view-toggle-bottom">
                  <a>
                      <xsl:attribute name="href"><xsl:value-of select="$ds_item_view_toggle_url"/></xsl:attribute>
                      <i18n:text>xmlui.ArtifactBrowser.ItemViewer.show_full</i18n:text>
                  </a>
              </p>
          </xsl:when>

          <!-- recurse without changing phase if we didn't output anything -->
          <xsl:otherwise>
            <!-- IMPORTANT: This test should be updated if clauses are added! -->
            <xsl:if test="$clause &lt; 10">
              <xsl:call-template name="itemSummaryView-DIM-fields">
                <xsl:with-param name="clause" select="($clause + 1)"/>
                <xsl:with-param name="phase" select="$phase"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>

         <!-- Generate the Creative Commons license information from the file section (DSpace deposit license hidden by default) -->
        <xsl:apply-templates select="mets:fileSec/mets:fileGrp[@USE='CC-LICENSE']"/>
    </xsl:template>
</xsl:stylesheet>
