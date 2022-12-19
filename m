Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EED9650783
	for <lists.virtualization@lfdr.de>; Mon, 19 Dec 2022 07:20:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09EFC401AF;
	Mon, 19 Dec 2022 06:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09EFC401AF
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EIQQMawc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLPmo15-Rba9; Mon, 19 Dec 2022 06:20:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CD0F94016F;
	Mon, 19 Dec 2022 06:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD0F94016F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E744CC0078;
	Mon, 19 Dec 2022 06:20:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE304C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Dec 2022 06:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67D4D60B15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Dec 2022 06:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67D4D60B15
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=EIQQMawc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UO3R7fAcXiO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Dec 2022 06:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09164605E0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09164605E0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Dec 2022 06:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671430822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmHgH44YO+1fWxNrpKpYFMutQaCxauHria2kl24sBVY=;
 b=EIQQMawcymvsd/wGsrEgC5+Ke36gt0lm7uNf3Kjipw9I+WcGpn7u74P6KRySavTzxh1ijR
 0LX0WlyII0mdawgIdqtKuVXUVdCpxoqVpxEJvXVLDfNk3YZX3KqMx+BAMAqJTCeWnVJR9i
 q6RlhXF4hhlOk99Rlr+JvBcG35y/OiQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-xLa_SNobMiOn6UmPh1i8DA-1; Mon, 19 Dec 2022 01:20:21 -0500
X-MC-Unique: xLa_SNobMiOn6UmPh1i8DA-1
Received: by mail-qv1-f72.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso5175400qvr.0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Dec 2022 22:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nmHgH44YO+1fWxNrpKpYFMutQaCxauHria2kl24sBVY=;
 b=54GVJ4fowaarDXUcdId7IObKh9oKztaienVOgPV6U19OlyeYW+jxjsgz2B7DZBuJiA
 JI0W+/7SaGrIlfsLi6VIMOKjt5f0RXlKkHdl7dCEKSWAvOYRgUP1TwS9HQ46a/VN7qR6
 0nSs4EQxWAoe8L15QyxT4s/EaPhV4OfwCJ4Sp0AvDvgom5Mc89CreJ+BRBS1ATLLA//7
 6N+rtYJuSGj3ZEk3uS2TU+4XEin7lCizIRtHUCMTlsFU83T+U6CQ2eZ1ismjmVb2E181
 t5rEy9WTZCjGbA3RVTWQd6jLJ0fH8Y2LPtNY4hENEuSbWwng+0ElUDoYzR86b8Mmp6YD
 g/2Q==
X-Gm-Message-State: ANoB5pmSNXki3BsPFZ3P0kvyyLVJLNTXcM2jP6MVu0cVUNfaghEaCFUI
 2cs4nIpY4iDzJ6ylAdnmda/SXoyN2KLwjkWOSuVCKq5B0FfRXwWGyvy0NWFKq4Gl9ZbPfVUSjg4
 CFazMW2PBKO8v4g8hVJIvdQt/UVcJgDX0Rinzuo+O9w==
X-Received: by 2002:a0c:f892:0:b0:4c7:6c12:5db with SMTP id
 u18-20020a0cf892000000b004c76c1205dbmr55819861qvn.40.1671430821202; 
 Sun, 18 Dec 2022 22:20:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4o5ruKrZQ3mkYIZlLSnXry7UvegxwMnK9f4SJe6lKY1RpuFh1tICbIL0ZeD2iaMWLDvlXWSA==
X-Received: by 2002:a0c:f892:0:b0:4c7:6c12:5db with SMTP id
 u18-20020a0cf892000000b004c76c1205dbmr55819846qvn.40.1671430820950; 
 Sun, 18 Dec 2022 22:20:20 -0800 (PST)
Received: from redhat.com ([45.144.113.29]) by smtp.gmail.com with ESMTPSA id
 f1-20020a05620a280100b006ee949b8051sm6470263qkp.51.2022.12.18.22.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 22:20:20 -0800 (PST)
Date: Mon, 19 Dec 2022 01:20:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
Message-ID: <20221219011647-mutt-send-email-mst@kernel.org>
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
 <Y0QYTq7KW9C731s0@debian.me>
 <87v8oqsq6k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
In-Reply-To: <87v8oqsq6k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: corbet@lwn.net, cohuck@redhat.com, linux-doc@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Bagas Sanjaya <bagasdotme@gmail.com>, kernel@collabora.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Oct 11, 2022 at 10:46:43AM +0200, Ricardo Ca=F1uelo wrote:
> >> +It's at this stage that the virtqueues will be allocated and configur=
ed
> >> +by calling the appropriate ``virtio_find`` helper function, such as
> >> +virtio_find_single_vq() or virtio_find_vqs(), which will end up
> >> +calling a transport-specific ``find_vqs`` method.
> >> +
> >
> > Looks like the wording at the beginning confuses me, so better say:
> >
> > ---- >8 ----
> > diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation=
/driver-api/virtio/virtio.rst
> > index 07fd2d7c51e689..7947b4ca690efd 100644
> > --- a/Documentation/driver-api/virtio/virtio.rst
> > +++ b/Documentation/driver-api/virtio/virtio.rst
> > @@ -123,10 +123,10 @@ When the device is registered to the virtio bus t=
he kernel will look
> >  for a driver in the bus that can handle the device and call that
> >  driver's ``probe`` method.
> =

> I think this is a matter of style as well, maybe a native speaker can
> pitch in about the correctness of it.
> =

> Cheers,
> Ricardo

I think I agree with this comment.  This seems minor enough so I applied
the patch for now. Bagas would you like to post your suggestion as a patch =
on
top? Would be appreciated. Thanks!

-- =

MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
