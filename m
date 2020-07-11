Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A0221C5D5
	for <lists.virtualization@lfdr.de>; Sat, 11 Jul 2020 20:44:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0148789280;
	Sat, 11 Jul 2020 18:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJeu6F0EY9ic; Sat, 11 Jul 2020 18:44:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5DB118927D;
	Sat, 11 Jul 2020 18:44:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20406C088E;
	Sat, 11 Jul 2020 18:44:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED483C016F
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jul 2020 18:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CEA1C21541
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jul 2020 18:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aB1EmQbyjvaO
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jul 2020 18:44:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 6569D2079C
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jul 2020 18:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594493082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bS19/wWScaoigC28WtauFL/l6Ha+uxblMLUn/Mypy1E=;
 b=DQMnvWiiZflT0AWnTyRqDBlBueVW65Yir9ON4xHra06Sb1qqJ5IheuIH4SU+o1SGGeFc2Y
 0fG6vYIBtCaigfc6vl3GtrSfo23tjEwHVKqNfTiLkV20OXxmVb0CRguD/SXTI6DSC9VCYh
 M2zsNySXeufAyhmDxANWlwYjj6/5Qbc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-_yEFJresN4q2RqpA6YoTPQ-1; Sat, 11 Jul 2020 14:44:41 -0400
X-MC-Unique: _yEFJresN4q2RqpA6YoTPQ-1
Received: by mail-wm1-f71.google.com with SMTP id y204so11735101wmd.2
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jul 2020 11:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bS19/wWScaoigC28WtauFL/l6Ha+uxblMLUn/Mypy1E=;
 b=cofMx8T4nXYvtI6533zPSexeUWCD/q9K0Zc1DP3gYCdLWA6XLl7zdSPc9HAxIyut8v
 KKIIQU29gy+zFZU+dRoQLEHCDuPqmIs82ugOyC7hgC0QCkMBYONWzwC45k5keNzlW3ea
 zJGLll2LF8SdsBFdIEMZfRRe9o1MSZsw3t/UBKAeL7gOP5R7QiD+VLPVw7T+fahRemmL
 AHCE+wK1M7Ld8DBl2DkjtQIP8h0O9dl3AEHGeekl8pV0KIwZIpyhSy9aCAbdfSuOE2iu
 MbNVNQfUpw6v/hdPu96T5NEDaGWTp4j78btdr197Our1t+t+A8J2VypWwcu/IkvHANFE
 CAvA==
X-Gm-Message-State: AOAM532XcOVzYf1Ivvr/V1xDsllkkbywyByev9mDDGiItAE8SNyUWRLm
 UX5kmnc24NykEWtMY3RkD8Lq9H69hcBPCUFbAJY1RqdeL/aJ2rcYe7NFRc0gMBH4jp0yC9dYm+r
 C7K6Yqyl10PoWZyQF739lWotqufU2UmeTcL/A42Xhfg==
X-Received: by 2002:a1c:4d11:: with SMTP id o17mr10838359wmh.134.1594493079816; 
 Sat, 11 Jul 2020 11:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygwQmxPTGDCpKObOVAAUSmALBrwy00qKV5C2K74YeE+tRXIP/JRrrSaIMIkdPE6mekfNCtDg==
X-Received: by 2002:a1c:4d11:: with SMTP id o17mr10838336wmh.134.1594493079525; 
 Sat, 11 Jul 2020 11:44:39 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 a84sm4541096wmh.47.2020.07.11.11.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2020 11:44:38 -0700 (PDT)
Date: Sat, 11 Jul 2020 14:44:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200711144334-mutt-send-email-mst@kernel.org>
References: <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
 <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
 <20200701172219-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2007101019340.4124@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007101019340.4124@sstabellini-ThinkPad-T480s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, konrad.wilk@oracle.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, Jul 10, 2020 at 10:23:22AM -0700, Stefano Stabellini wrote:
> Sorry for the late reply -- a couple of conferences kept me busy.
> 
> 
> On Wed, 1 Jul 2020, Michael S. Tsirkin wrote:
> > On Wed, Jul 01, 2020 at 10:34:53AM -0700, Stefano Stabellini wrote:
> > > Would you be in favor of a more flexible check along the lines of the
> > > one proposed in the patch that started this thread:
> > > 
> > >     if (xen_vring_use_dma())
> > >             return true;
> > > 
> > > 
> > > xen_vring_use_dma would be implemented so that it returns true when
> > > xen_swiotlb is required and false otherwise.
> > 
> > Just to stress - with a patch like this virtio can *still* use DMA API
> > if PLATFORM_ACCESS is set. So if DMA API is broken on some platforms
> > as you seem to be saying, you guys should fix it before doing something
> > like this..
> 
> Yes, DMA API is broken with some interfaces (specifically: rpmesg and
> trusty), but for them PLATFORM_ACCESS is never set. That is why the
> errors weren't reported before. Xen special case aside, there is no
> problem under normal circumstances.

So why not fix DMA API? Then this patch is not needed.


> 
> If you are OK with this patch (after a little bit of clean-up), Peng,
> are you OK with sending an update or do you want me to?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
