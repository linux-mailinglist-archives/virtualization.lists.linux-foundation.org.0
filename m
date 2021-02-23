Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF79322A33
	for <lists.virtualization@lfdr.de>; Tue, 23 Feb 2021 13:09:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC4C83147;
	Tue, 23 Feb 2021 12:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCncOP2qgyRx; Tue, 23 Feb 2021 12:09:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB463831DE;
	Tue, 23 Feb 2021 12:09:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 760E2C0012;
	Tue, 23 Feb 2021 12:09:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 821A7C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6516605BC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7p8ZkAGi84W
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:09:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55D516058D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614082168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yf9BgNu73AxJWcC+uWhBOUpOMoNk4abmVr/8YXLU2rU=;
 b=IoI58CoRn/1Xsvu+fJYeVC4yJhMR9mUTkwkuTzYvF4JAqHOCCSEh4Pg3wPdIXYx2NgLnCa
 /zudBUJ4woUhBDxKj4/mHDkt740Tz2ZtXAwzIbw6OWfA/CQ5OFgrQ7X52vUCGcU+K7PibN
 nBhdAh3DBqoVufMiFC1PB+OWVBEyuOM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-wc7Tb-CQMjq9lkxGA3Ng_Q-1; Tue, 23 Feb 2021 07:09:06 -0500
X-MC-Unique: wc7Tb-CQMjq9lkxGA3Ng_Q-1
Received: by mail-wr1-f69.google.com with SMTP id l10so7246470wry.16
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 04:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yf9BgNu73AxJWcC+uWhBOUpOMoNk4abmVr/8YXLU2rU=;
 b=KIc3sbJqsr134t/kwr3ZnShjeFBGKu0UZLCDDyaGjaZsvb2yKGTKVGRSDBMxrsFUtC
 U1PZ072JVKHbEvlXVd6p3VhKJDkfgYhO/dpmqI7P6pDCrQgi09616aStf8LjbqNGK3Zk
 aDJRu9OQa6JGyN1DtiYKYBUe4rejFVh0lEaXfHHOvuwZx292jQhdxXAifgwFNuA95wTF
 7Nouy2BJchIisQClq+vo+GBn+MRbqLD7bo1iY9RAGC9PsP/Suj2GxcutDjQkZYykbuum
 OS+3UG9VDRnqu/bcjIBvMApfUA3Mbo2FmvdnReQufNrYeAXsnt212TXMyzmS5ym1OCJf
 iHXw==
X-Gm-Message-State: AOAM530gt08SmRTUuo+vGpziz8aJMwTPLYoTbfLGmVnwocraiwt5bJgk
 ZCLnLjy2VO0cE/V9IDtWUNugh8XvHssJRPe/BgzVTmXNfCvzQrYiedhTGby6mfeTCeWwwTj2n1l
 lNodbdcLw+zCFiTF0rcULobxIgXMXBKPTsG4PaZdcmw==
X-Received: by 2002:a1c:b443:: with SMTP id d64mr5302926wmf.5.1614082145055;
 Tue, 23 Feb 2021 04:09:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPt/Ygq81ajNqFSVMer4KiuG1pgEpFuOONvcgTlmWAjxDDCBt2KXtxHvZfCw9RDPw2vNCAig==
X-Received: by 2002:a1c:b443:: with SMTP id d64mr5302917wmf.5.1614082144933;
 Tue, 23 Feb 2021 04:09:04 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id x66sm2353275wmg.6.2021.02.23.04.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 04:09:04 -0800 (PST)
Date: Tue, 23 Feb 2021 07:09:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Subject: Re: [PATCH v5 0/9] ALSA: add virtio sound driver
Message-ID: <20210223070839-mutt-send-email-mst@kernel.org>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 virtualization@lists.linux-foundation.org
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

On Mon, Feb 22, 2021 at 04:34:35PM +0100, Anton Yakovlev wrote:
> This series implements a driver part of the virtio sound device
> specification v8 [1].
> 
> The driver supports PCM playback and capture substreams, jack and
> channel map controls. A message-based transport is used to write/read
> PCM frames to/from a device.
> 
> As a device part was used OpenSynergy proprietary implementation.
> 
> v5 changes:
>  - Fixed another bunch of sparse warnings
>    (replaced virtio_cread() -> virtio_cread_le()), no functional changes.
> (Sorry, I didn't know how to run sparse locally, now everything should be fixed)
> 
> [1] https://lists.oasis-open.org/archives/virtio-dev/202003/msg00185.html


In the future please number patches from 1, not from 2.
thanks!

> 
> Anton Yakovlev (9):
>   uapi: virtio_ids: add a sound device type ID from OASIS spec
>   ALSA: virtio: add virtio sound driver
>   ALSA: virtio: handling control messages
>   ALSA: virtio: build PCM devices and substream hardware descriptors
>   ALSA: virtio: handling control and I/O messages for the PCM device
>   ALSA: virtio: PCM substream operators
>   ALSA: virtio: introduce jack support
>   ALSA: virtio: introduce PCM channel map support
>   ALSA: virtio: introduce device suspend/resume support
> 
>  MAINTAINERS                     |   9 +
>  include/uapi/linux/virtio_ids.h |   1 +
>  include/uapi/linux/virtio_snd.h | 334 +++++++++++++++++++++
>  sound/Kconfig                   |   2 +
>  sound/Makefile                  |   3 +-
>  sound/virtio/Kconfig            |  10 +
>  sound/virtio/Makefile           |  13 +
>  sound/virtio/virtio_card.c      | 462 +++++++++++++++++++++++++++++
>  sound/virtio/virtio_card.h      | 113 ++++++++
>  sound/virtio/virtio_chmap.c     | 219 ++++++++++++++
>  sound/virtio/virtio_ctl_msg.c   | 310 ++++++++++++++++++++
>  sound/virtio/virtio_ctl_msg.h   |  78 +++++
>  sound/virtio/virtio_jack.c      | 233 +++++++++++++++
>  sound/virtio/virtio_pcm.c       | 498 ++++++++++++++++++++++++++++++++
>  sound/virtio/virtio_pcm.h       | 120 ++++++++
>  sound/virtio/virtio_pcm_msg.c   | 392 +++++++++++++++++++++++++
>  sound/virtio/virtio_pcm_ops.c   | 491 +++++++++++++++++++++++++++++++
>  17 files changed, 3287 insertions(+), 1 deletion(-)
>  create mode 100644 include/uapi/linux/virtio_snd.h
>  create mode 100644 sound/virtio/Kconfig
>  create mode 100644 sound/virtio/Makefile
>  create mode 100644 sound/virtio/virtio_card.c
>  create mode 100644 sound/virtio/virtio_card.h
>  create mode 100644 sound/virtio/virtio_chmap.c
>  create mode 100644 sound/virtio/virtio_ctl_msg.c
>  create mode 100644 sound/virtio/virtio_ctl_msg.h
>  create mode 100644 sound/virtio/virtio_jack.c
>  create mode 100644 sound/virtio/virtio_pcm.c
>  create mode 100644 sound/virtio/virtio_pcm.h
>  create mode 100644 sound/virtio/virtio_pcm_msg.c
>  create mode 100644 sound/virtio/virtio_pcm_ops.c
> 
> -- 
> 2.30.0
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
