Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD8557155
	for <lists.virtualization@lfdr.de>; Thu, 23 Jun 2022 06:00:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03ADF41CCD;
	Thu, 23 Jun 2022 04:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03ADF41CCD
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUmxjqpt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A52cqH4Sl7dI; Thu, 23 Jun 2022 04:00:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6BBEA41CA2;
	Thu, 23 Jun 2022 04:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BBEA41CA2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE5FCC007E;
	Thu, 23 Jun 2022 04:00:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DFCDC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 04:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F6E161345
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 04:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F6E161345
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUmxjqpt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2U8wo5sNmfg
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 04:00:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16D9061344
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16D9061344
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 04:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655956811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFJiCCiUdpJFyvkqsgfrNR9atyVk/WWb+BR9ISMMgCc=;
 b=OUmxjqptZE8Ju3ugdmrFBZljUgiUEpLDa5rg46/uG4voR4ociP00qpA7Ea7y15KXhnqZyW
 iLkLUOLhWifFR8T9wDglqRu4Ko0LM21WlLV1FVGvFfGmbO0e8BzqAO/kMnGL83+OHjaA54
 THjc9Uk27+n5JUUIubknlPL51U6cmI4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-_7c8_dnSOxiYpfOTnqBgDg-1; Thu, 23 Jun 2022 00:00:09 -0400
X-MC-Unique: _7c8_dnSOxiYpfOTnqBgDg-1
Received: by mail-lf1-f71.google.com with SMTP id
 bi38-20020a0565120ea600b0047f640eaee0so6087365lfb.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 21:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DFJiCCiUdpJFyvkqsgfrNR9atyVk/WWb+BR9ISMMgCc=;
 b=qEE2JpZG+ryh7c6WOUraDvj2C/eqxJCNh24YnJgSjjBacFe0jigJRKNZ94P9ien384
 08z6Z5lvSt9lgTgoJiwR6LLHl0haty2r160osNmawD31rI3j+GDzwaTxsKo8Yk2pa58Y
 7v853phhgwA7AeTNgbguR04MhQaP7u0YLRfdfjPCOCAyiStbpYzraKZuYOYGKlycL1FV
 6gQSMpJPsRAjhJBwxav+x/7MhfAJWcOgeydb9+HJXEoklkzhYCyU1dlkakR0qV3Yv6Sy
 GA4ceUfg0QvDGS6iHcecpLtz5gVY/Ino+H+/Iy6MirtHzglnJ9lHxXALNsyDMXaEm9rj
 absw==
X-Gm-Message-State: AJIora/pk3souVba2rzPvnPMwvlt2THE6Pan73tUWuCemk0nthk2DUxD
 U/FyYWknGGYl/Tkz1apRIZJnrBx5qFf7sWWshj+a31YoPW9itVb06xfm9V9lXqMqNKfkZUnQApS
 RET9mCsM/Gp3LrU5GHIwxSRMAbLKjk4Kp+fw31xVbghQw2QATfSzfWu5cUA==
X-Received: by 2002:a05:651c:88f:b0:253:f747:2fd8 with SMTP id
 d15-20020a05651c088f00b00253f7472fd8mr3484120ljq.496.1655956807539; 
 Wed, 22 Jun 2022 21:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v72o2N38SMxSlozjDx2TPcJlvx8ZLCicgrI030RtlrGiCZEN6ihlvpcHYIZOvlx9ZLZwYkpX5amBXIG/pi+0s=
X-Received: by 2002:a05:651c:88f:b0:253:f747:2fd8 with SMTP id
 d15-20020a05651c088f00b00253f7472fd8mr3484114ljq.496.1655956807342; Wed, 22
 Jun 2022 21:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220622153936.to2yh5zixjevy4r4@sgarzare-redhat>
 <CAJaqyWdBjJ2AUQL2hHAgEMQG1Gqp5vMj5Wrpz2p+hpXQGzKPLA@mail.gmail.com>
In-Reply-To: <CAJaqyWdBjJ2AUQL2hHAgEMQG1Gqp5vMj5Wrpz2p+hpXQGzKPLA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 23 Jun 2022 11:59:56 +0800
Message-ID: <CACGkMEv0w8MdVwTX_G1k8uSqPDY2XWVA2Mhw=Zop-TZA97-+4w@mail.gmail.com>
Subject: Re: vhost-vdpa tests in tools/virtio
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Michael Tsirkin <mst@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Jun 23, 2022 at 3:21 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Jun 22, 2022 at 5:39 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > Hi,
> > while developing/testing the vdpa-blk support in libblkio [1], I
> > realized that we added several regressions with the "[PATCH v2 00/19]
> > Control VQ support in vDPA" series (patches/clarifications already
> > sent).
> >
> > To minimize these problems in the future, I was thinking of adding tests
> > for vhost_vdpa in tools/virtio using vDPA simulators as devices.
> >
> > What do you think about this?
>
> I think it's definitely a good idea. Maybe a good starting point is to
> copy the virtio_test for the moment?
>
> Maybe to add a new parameter to tell it it will test a vhost-vdpa
> device? Initialization is pretty similar.

+1

Thanks

>
> Thanks!
>
> > Before starting, please let me know if we already have something.
> >
> > Thanks,
> > Stefano
> >
> > [1] https://gitlab.com/libblkio/libblkio
> >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
