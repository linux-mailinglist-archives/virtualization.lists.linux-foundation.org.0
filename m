Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A138322AF7
	for <lists.virtualization@lfdr.de>; Tue, 23 Feb 2021 13:59:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AECF984ECD;
	Tue, 23 Feb 2021 12:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jB3cXbPwjAh0; Tue, 23 Feb 2021 12:59:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D88D84475;
	Tue, 23 Feb 2021 12:59:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D96ECC0012;
	Tue, 23 Feb 2021 12:59:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18CD8C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06AE582F32
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 362Y6hN68OP0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:59:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 785D882BFD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614085188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nsb6410KD77Etu5NLRJ2iY9H5YUf7juaiTO6VgDZxRs=;
 b=ZNULvPHiMTv7z2sSOrzySutdySvALKSHUTRnIs/0yT1gXhdI3e9NCs9V6QHURNqwVJsEqX
 Mz0M4d8/m5OiisQ0oVjgPoD43nqdXEsaB67a8qSUJxOyesYO5mh75V4YyMuFIfeU1ij4WM
 i8b2ste962kxlY0gwCmS+JuPmy1r9TE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-qQy9SGO3NzOJDNzmj0d3kw-1; Tue, 23 Feb 2021 07:59:44 -0500
X-MC-Unique: qQy9SGO3NzOJDNzmj0d3kw-1
Received: by mail-wr1-f69.google.com with SMTP id k5so2264397wrw.14
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 04:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nsb6410KD77Etu5NLRJ2iY9H5YUf7juaiTO6VgDZxRs=;
 b=iM5R2paxavNGkuD3yfsrxbP3YmwE2pMVKgdgXpK6obtTgrU9uZ1hwntDwa+iEAx5nj
 KsAiJaFc1H2e7CXlJlpmQS+dU9Omg4i4eEZzUW1LqO1S0m5OdsWvykIjYM64d6Iia2Wk
 S+CvFq1R73Scwg0/SGCD7lsoQfRGln4zw9M5OpTrXKs+E06X6cBgOMHZ2aQFZPeFMB17
 QO7gyIjdRFYFl4EJgZBSZP4AHyQD1EqfcsuE+nzwIENQWbMZX3dKsSko7pM6PQZs7XJ6
 o7iCem+fsNA1WyxsUpkVOD2E/Y7PZPKKDdXc3BOtVFjEVgFf328fP9KHc8ttOZSYu7Gv
 TP1A==
X-Gm-Message-State: AOAM532aJeHdDzFNnr3Wmnc79zcxwync05QwfLCV2VXc883+soKc5Mit
 5LXHnQCzu0gkSEFNqmwhQuqscS9/YpvnQF7poZf95o90epDg1TMAdQqk/m5unz52mtfht83Igso
 y43Ch/q2+cvL9up+X70Aq6UXWdM0P6GQCLL9rGoxfmw==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr23167724wmk.27.1614085183403; 
 Tue, 23 Feb 2021 04:59:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziaQQBGEm0zpZoJ3pmPnb/Dw/YUrycTxx3mxxJDNxlW3WbQMuk3Z4T9hEc58x5SpZ/z8vOYQ==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr23167709wmk.27.1614085183240; 
 Tue, 23 Feb 2021 04:59:43 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id n66sm2527905wmn.25.2021.02.23.04.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 04:59:42 -0800 (PST)
Date: Tue, 23 Feb 2021 07:59:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Subject: Re: [virtio-dev] Re: [PATCH v5 0/9] ALSA: add virtio sound driver
Message-ID: <20210223075813-mutt-send-email-mst@kernel.org>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
 <20210223070839-mutt-send-email-mst@kernel.org>
 <bce13fa2-3ee5-0c6c-5761-17f0389c2d7b@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <bce13fa2-3ee5-0c6c-5761-17f0389c2d7b@opensynergy.com>
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

On Tue, Feb 23, 2021 at 01:33:57PM +0100, Anton Yakovlev wrote:
> On 23.02.2021 13:09, Michael S. Tsirkin wrote:
> > On Mon, Feb 22, 2021 at 04:34:35PM +0100, Anton Yakovlev wrote:
> > > This series implements a driver part of the virtio sound device
> > > specification v8 [1].
> > > 
> > > The driver supports PCM playback and capture substreams, jack and
> > > channel map controls. A message-based transport is used to write/read
> > > PCM frames to/from a device.
> > > 
> > > As a device part was used OpenSynergy proprietary implementation.
> > > 
> > > v5 changes:
> > >   - Fixed another bunch of sparse warnings
> > >     (replaced virtio_cread() -> virtio_cread_le()), no functional changes.
> > > (Sorry, I didn't know how to run sparse locally, now everything should be fixed)
> > > 
> > > [1] https://lists.oasis-open.org/archives/virtio-dev/202003/msg00185.html
> > 
> > 
> > In the future please number patches from 1, not from 2.
> > thanks!
> 
> But they are numbered automatically by git. Patch #1 is for virtio_ids.h

Weird somehow I was missing patch #1. Applied now, thanks!

> 
> > > 
> > > Anton Yakovlev (9):
> > >    uapi: virtio_ids: add a sound device type ID from OASIS spec
> > >    ALSA: virtio: add virtio sound driver
> > >    ALSA: virtio: handling control messages
> > >    ALSA: virtio: build PCM devices and substream hardware descriptors
> > >    ALSA: virtio: handling control and I/O messages for the PCM device
> > >    ALSA: virtio: PCM substream operators
> > >    ALSA: virtio: introduce jack support
> > >    ALSA: virtio: introduce PCM channel map support
> > >    ALSA: virtio: introduce device suspend/resume support
> > > 
> > >   MAINTAINERS                     |   9 +
> > >   include/uapi/linux/virtio_ids.h |   1 +
> > >   include/uapi/linux/virtio_snd.h | 334 +++++++++++++++++++++
> > >   sound/Kconfig                   |   2 +
> > >   sound/Makefile                  |   3 +-
> > >   sound/virtio/Kconfig            |  10 +
> > >   sound/virtio/Makefile           |  13 +
> > >   sound/virtio/virtio_card.c      | 462 +++++++++++++++++++++++++++++
> > >   sound/virtio/virtio_card.h      | 113 ++++++++
> > >   sound/virtio/virtio_chmap.c     | 219 ++++++++++++++
> > >   sound/virtio/virtio_ctl_msg.c   | 310 ++++++++++++++++++++
> > >   sound/virtio/virtio_ctl_msg.h   |  78 +++++
> > >   sound/virtio/virtio_jack.c      | 233 +++++++++++++++
> > >   sound/virtio/virtio_pcm.c       | 498 ++++++++++++++++++++++++++++++++
> > >   sound/virtio/virtio_pcm.h       | 120 ++++++++
> > >   sound/virtio/virtio_pcm_msg.c   | 392 +++++++++++++++++++++++++
> > >   sound/virtio/virtio_pcm_ops.c   | 491 +++++++++++++++++++++++++++++++
> > >   17 files changed, 3287 insertions(+), 1 deletion(-)
> > >   create mode 100644 include/uapi/linux/virtio_snd.h
> > >   create mode 100644 sound/virtio/Kconfig
> > >   create mode 100644 sound/virtio/Makefile
> > >   create mode 100644 sound/virtio/virtio_card.c
> > >   create mode 100644 sound/virtio/virtio_card.h
> > >   create mode 100644 sound/virtio/virtio_chmap.c
> > >   create mode 100644 sound/virtio/virtio_ctl_msg.c
> > >   create mode 100644 sound/virtio/virtio_ctl_msg.h
> > >   create mode 100644 sound/virtio/virtio_jack.c
> > >   create mode 100644 sound/virtio/virtio_pcm.c
> > >   create mode 100644 sound/virtio/virtio_pcm.h
> > >   create mode 100644 sound/virtio/virtio_pcm_msg.c
> > >   create mode 100644 sound/virtio/virtio_pcm_ops.c
> > > 
> > > --
> > > 2.30.0
> > > 
> > 
> > 
> > ---------------------------------------------------------------------
> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> > 
> > 
> 
> -- 
> Anton Yakovlev
> Senior Software Engineer
> 
> OpenSynergy GmbH
> Rotherstr. 20, 10245 Berlin

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
