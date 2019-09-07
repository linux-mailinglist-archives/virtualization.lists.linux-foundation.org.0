Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C0276AC404
	for <lists.virtualization@lfdr.de>; Sat,  7 Sep 2019 04:00:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1001029B8;
	Sat,  7 Sep 2019 02:00:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9338A28ED
	for <virtualization@lists.linux-foundation.org>;
	Sat,  7 Sep 2019 02:00:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
	[202.108.3.166])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 67593756
	for <virtualization@lists.linux-foundation.org>;
	Sat,  7 Sep 2019 02:00:24 +0000 (UTC)
Received: from unknown (HELO [IPv6:::ffff:192.168.199.155])([114.254.173.51])
	by sina.com with ESMTP
	id 5D730F34000055C2; Sat, 7 Sep 2019 10:00:22 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 35191854919708
MIME-Version: 1.0
To: Frediano Ziglio <fziglio@redhat.com>
From: Hillf Danton <hdanton@sina.com>
Subject: Re: [Spice-devel] Xorg indefinitely hangs in kernelspace
Date: Sat, 7 Sep 2019 10:00:20 +0800
Importance: normal
X-Priority: 3
Thread-Topic: Xorg indefinitely hangs in kernelspace
In-Reply-To: <236676538.10995729.1567801661076.JavaMail.zimbra@redhat.com>
References: <20190906055322.17900-1-hdanton@sina.com>
	<236676538.10995729.1567801661076.JavaMail.zimbra@redhat.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	HTML_MESSAGE, MISSING_MID, RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
	Jaak Ristioja <jaak@ristioja.ee>,
	"spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8170375718104058186=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org
Message-Id: <20190907020028.1001029B8@mail.linuxfoundation.org>


--===============8170375718104058186==
Content-Type: multipart/alternative;
	boundary="_14B5F2F5-2A3E-4F1A-AB25-A0821578134D_"


--_14B5F2F5-2A3E-4F1A-AB25-A0821578134D_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

From Frediano Ziglio <fziglio@redhat.com>
>
> Where does it came this patch?

My fingers tapping the keyboard.

> Is it already somewhere?

No idea yet.

> Is it supposed to fix this issue?

It may do nothing else as far as I can tell.

> Does it affect some other card beside QXL?

Perhaps.



--_14B5F2F5-2A3E-4F1A-AB25-A0821578134D_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.DefaultFontHxMailStyle
	{mso-style-name:"Default Font HxMail Style";
	font-family:DengXian;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DZH-CN link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span class=3DDefaultFontHxMailStyle=
><span lang=3DEN-US>From Frediano Ziglio &lt;fziglio@redhat.com&gt;</span><=
/span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;<o:p>&nbsp;</o:p></sp=
an></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; Where does it came this=
 patch?</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p>=
</span></p><p class=3DMsoNormal><span lang=3DEN-US>My fingers tapping the k=
eyboard.</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p=
></span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; Is it already some=
where?</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-US>No idea yet.</span></p><p=
 class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-US>&gt; Is it supposed to fix this issue?</spa=
n></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US>It may do nothing else as far as I c=
an tell.</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p=
></span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; Does it affect som=
e other card beside QXL?</span></p><p class=3DMsoNormal><span lang=3DEN-US>=
<o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Perhaps=
.</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span=
></p><p class=3DMsoNormal><span class=3DDefaultFontHxMailStyle><span lang=
=3DEN-US><o:p>&nbsp;</o:p></span></span></p></div></body></html>=

--_14B5F2F5-2A3E-4F1A-AB25-A0821578134D_--



--===============8170375718104058186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8170375718104058186==--


