Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ED923692
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 14:53:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8BCAED2A;
	Mon, 20 May 2019 12:53:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B1326D07
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 12:53:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C011D81A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 12:53:03 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id f24so16053993qtk.11
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 05:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=FNAZcWqflA9IRxmObxU4/lbcnrS1uyVvwLBkqQKN8z8=;
	b=U5886w7iUwdCKeaOM3cqsgpDH17TW9tUqmH8QFg7OLNPhFExcNqOaUsxmGCdtYMyoq
	A/6+aWrGrK1zauLVrzpVDxLbTWT14EjXabVNwTeNh+o/M3jpVIviSkVtUH0dNKlWYpfE
	vg+3N5h+nRalOd+SwooVNe2kP8p5RRpF2h3Uk3MRRqU+T4CfGVs1DObszHfyadpqHGpp
	aza/PdEQci/xr4kflu2HW/d4SuxK1qaXoSxhKk8MWeYxP+Q38c4RVsybMZwKkk+oOaTI
	t9e1sPaafyoZ55kGxSxhP0Cp70JlhHbVRGC5RusxCfKdEDQZHbwAhIZo9++U05CVQcl0
	l0TA==
X-Gm-Message-State: APjAAAV1SjWWOyZqWluMWU5Lg/caGFUV7cHuUZSy3smZlw+yCGPTiF/i
	tiAaulbdrIPolok/c8p9MKM8Vg==
X-Google-Smtp-Source: APXvYqxZc3EADFrIKvZtBidjDNyX7MfQHCtBgDMnAiOTyPCPBnueOwuGeJwhQyllR7iNwwTq6Wygtw==
X-Received: by 2002:ac8:2ea1:: with SMTP id h30mr21686178qta.333.1558356782974;
	Mon, 20 May 2019 05:53:02 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	v3sm13052762qtc.97.2019.05.20.05.53.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 05:53:01 -0700 (PDT)
Date: Mon, 20 May 2019 08:52:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 0/4] Prevent vhost kthread from hogging CPU
Message-ID: <20190520085207-mutt-send-email-mst@kernel.org>
References: <1558067392-11740-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558067392-11740-1-git-send-email-jasowang@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	pbonzini@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, May 17, 2019 at 12:29:48AM -0400, Jason Wang wrote:
> Hi:
> 
> This series try to prevent a guest triggerable CPU hogging through
> vhost kthread. This is done by introducing and checking the weight
> after each requrest. The patch has been tested with reproducer of
> vsock and virtio-net. Only compile test is done for vhost-scsi.
> 
> Please review.
> This addresses CVE-2019-3900.

OK I think we should clean this code some more but given
it's a CVE fix maybe it's best to do as a patch on top.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Dave do you want to merge this or should I?

> 
> Changs from V1:
> - fix user-ater-free in vosck patch
> 
> Jason Wang (4):
>   vhost: introduce vhost_exceeds_weight()
>   vhost_net: fix possible infinite loop
>   vhost: vsock: add weight support
>   vhost: scsi: add weight support
> 
>  drivers/vhost/net.c   | 41 ++++++++++++++---------------------------
>  drivers/vhost/scsi.c  | 21 ++++++++++++++-------
>  drivers/vhost/vhost.c | 20 +++++++++++++++++++-
>  drivers/vhost/vhost.h |  5 ++++-
>  drivers/vhost/vsock.c | 28 +++++++++++++++++++++-------
>  5 files changed, 72 insertions(+), 43 deletions(-)
> 
> -- 
> 1.8.3.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
