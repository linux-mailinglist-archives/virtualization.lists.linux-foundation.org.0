Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D42CA301D
	for <lists.virtualization@lfdr.de>; Fri, 30 Aug 2019 08:38:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F55D5BEF;
	Fri, 30 Aug 2019 06:38:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9EE975BE4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 06:36:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E7FC213A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 06:36:43 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k2so4613540wmj.4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kk8x3cKyvvXICceum0INWYEPewq78FbjmDWi29s8UWM=;
	b=QIdRALQscUj1g5pKhrT+kqnbA1s1DJFRuUEErgbicE2+DP/FHUc1xZmMRmRok1pdPJ
	BgmW/KHS6p8w+iIYlgwIbgMvOpHM14YoaDcSm49QJwXEwTb7Rs0lPNDkqLyzdh/Rs3Si
	FpZAgsQXNOx3X1q0XJZiN7PlRWBCXvApkWmKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kk8x3cKyvvXICceum0INWYEPewq78FbjmDWi29s8UWM=;
	b=BjBmKU735uHuaeJNEGMTvrEvcxeiYsKpMF2tBVJ/bLxEGkWllkSSFIM5nAxl6Zo/8Z
	XVRlXftgIm4wFKwg2qrrBSe0Yx+rjasrti8dBebzdDCjvaW10ZUpw/f5zqUSwAUUhsvA
	idOmXvnMgi96pVLNX0//3pscYUo7h4Cydd3nDLoYkFjwQXmrTZilraKMEWgjl731WtuP
	xSVz/BP6U8Sil8XZo1Ks9OWUbvhpF0m+BPSZKboFZEajV7BqR4jNGwCl3vqSG4+C0aq7
	X52LDRL0DsOHCu08X5QEg7v8syT/yy+XNKnvLaIPWGg9ET9RKXtBGXWb+8ryIcbvYfka
	eicg==
X-Gm-Message-State: APjAAAUVd4kmvJBO5Um5OH4DM1USFOT/IowzpUlzf+/YzEe0SQxHH0Jw
	Ja2LSsnLBDXGZROmucW8OXVsETOlTm4mLpnGt9F+Qg==
X-Google-Smtp-Source: APXvYqz362DNbXCxqBJOcBjnm+Qh+pOH4b4faggNpPXu9chV19w7iO+en8zEk7AMRyHYLrvQQzN2TO3RTAlICTUm6U8=
X-Received: by 2002:a1c:7319:: with SMTP id d25mr14416105wmb.123.1567147002204;
	Thu, 29 Aug 2019 23:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
	<20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
In-Reply-To: <20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
From: David Riley <davidriley@chromium.org>
Date: Thu, 29 Aug 2019 23:36:30 -0700
Message-ID: <CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
	virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============6992158318738991922=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============6992158318738991922==
Content-Type: multipart/alternative; boundary="00000000000060f46005914fd875"

--00000000000060f46005914fd875
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 11:09 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> >  {
> >       if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
> >               kfree(vbuf->resp_buf);
> > -     kfree(vbuf->data_buf);
> > +     kvfree(vbuf->data_buf);
>
> if (is_vmalloc_addr(vbuf->data_buf)) ...
>
> needed here I gues?
>

kvfree() handles vmalloc/kmalloc/kvmalloc internally by doing that check.


>
> > +/* Create sg_table from a vmalloc'd buffer. */
> > +static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size)
>
> Hmm, isn't there an existing function for that?
> I'd be surprised if virtio-gpu is the first driver needing this ...
>
> And it case there really isn't one this should probably added to the
> vmalloc or scatterlist code, not the virtio-gpu driver.
>

There's a few other similar ones around:
- pack_sg_list in net/9p/trans_virtio.c, assumes contiguous array of
scatterlist and non-vmalloc
- videobuf_vmalloc_to_sg in drivers/media/v4l2-core/videobuf-dma-sg.c,
assumes contiguous array of scatterlist and that the buffer being converted
is page aligned (the l
- vmalloc_to_sg() in drivers/media/common/saa7146/saa7146_core.c, duplicate
of videobuf_vmalloc_to_sg

None of the existing ones seemed to do what was needed and the convention
seemed to pack an sg table as needed for the usage and just keep it in the
module so that's what I followed.  I'm not very familiar with these APIs so
maybe there's something I missed, but I did look through the helpers in
lib/scatterlist.c and didn't see anything.  If you think it is better
suited to live in scatterlist I can prepare another change for that.

Dave

>
> cheers,
>   Gerd
>
>

--00000000000060f46005914fd875
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 29, 2019 at 11:09 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =
Hi,<br>
<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vbuf-&gt;resp_size &gt; MAX_INLINE_RESP_=
SIZE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(vbuf-&gt;r=
esp_buf);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0kfree(vbuf-&gt;data_buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kvfree(vbuf-&gt;data_buf);<br>
<br>
if (is_vmalloc_addr(vbuf-&gt;data_buf)) ...<br>
<br>
needed here I gues?<br></blockquote><div><br></div><div>kvfree() handles vm=
alloc/kmalloc/kvmalloc internally by doing that check.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +/* Create sg_table from a vmalloc&#39;d buffer. */<br>
&gt; +static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size)<br>
<br>
Hmm, isn&#39;t there an existing function for that?<br>
I&#39;d be surprised if virtio-gpu is the first driver needing this ...<br>
<br>
And it case there really isn&#39;t one this should probably added to the<br=
>
vmalloc or scatterlist code, not the virtio-gpu driver.<br></blockquote><di=
v><br></div><div>There&#39;s a few other similar ones around:</div><div>- p=
ack_sg_list in net/9p/trans_virtio.c, assumes contiguous=C2=A0array of scat=
terlist and non-vmalloc</div><div>-=C2=A0videobuf_vmalloc_to_sg in=C2=A0dri=
vers/media/v4l2-core/videobuf-dma-sg.c, assumes contiguous array of scatter=
list and that the buffer being converted is page aligned (the l</div><div>-=
 vmalloc_to_sg() in drivers/media/common/saa7146/saa7146_core.c, duplicate =
of videobuf_vmalloc_to_sg</div><div><br></div><div>None of the existing one=
s seemed to do what was needed and the convention seemed to pack an sg tabl=
e as needed for the usage and just keep it in the module so that&#39;s what=
 I followed.=C2=A0 I&#39;m not very familiar with these APIs so maybe there=
&#39;s something I missed, but I did look through the helpers in lib/scatte=
rlist.c and didn&#39;t see anything.=C2=A0 If you think it is better suited=
 to live in scatterlist I can prepare another change for that.</div><div><b=
r></div><div>Dave</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
cheers,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--00000000000060f46005914fd875--

--===============6992158318738991922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6992158318738991922==--
