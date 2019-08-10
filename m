Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D716C88C8C
	for <lists.virtualization@lfdr.de>; Sat, 10 Aug 2019 19:52:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EC631B50;
	Sat, 10 Aug 2019 17:52:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 467B1B1F
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 17:52:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 45D9F6D6
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 17:52:45 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w17so18400939qto.10
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 10:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=66SEGc5TGIf1NyUu+jEpEXEpotUOCLnMVCZU4G+UmoQ=;
	b=b9acn29260YxwdVMs78hkD6DYPR/6REkO0AS4o6padFLxAWgbLHujxcNkvlOSp0pEf
	+ZWMVdNCqJ6M0gWqrW4vcGTmQaacQZ5mbxVb6HCAYfxmVa7fb+o8a1yWhDpwKwwt9pb1
	9cgcY2MOcACuJ0NGU4RJoQaPJFMHCPnRvB9lrP/3se2GxxWvlY0neFhaOu9e5Uz83OFD
	48yvY48gOK1JQIeG9nNU2H8DmC4MFogPI3jvUd9GHPamc3FJCsetqjqQox3ldKyl8KN0
	C4jcXtrpUb50TiG+XqXJbO6AD/baYgJKkpo/yr/m+y4fPC8nmtjh28T2np04wlmgrBh8
	IXdg==
X-Gm-Message-State: APjAAAUfx5qpwqQGUcptUQ3inqNCSGKeI2GDM9dntg+IHD7LYvsnbh7Q
	ETxBMcVwbWpY6ud1FnF4Kcs6rQ==
X-Google-Smtp-Source: APXvYqyu+J3eoZAKc/L0K7nzHrnvjWmGtHdW7l8r8vj9yQS0QK9zcmeYBT3jtDeUTZAm2K2OrM0azQ==
X-Received: by 2002:ac8:2fc8:: with SMTP id m8mr23627567qta.269.1565459564445; 
	Sat, 10 Aug 2019 10:52:44 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	a135sm45568245qkg.72.2019.08.10.10.52.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 10 Aug 2019 10:52:43 -0700 (PDT)
Date: Sat, 10 Aug 2019 13:52:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
Message-ID: <20190810134948-mutt-send-email-mst@kernel.org>
References: <20190809054851.20118-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809054851.20118-1-jasowang@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, jgg@ziepe.ca, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

On Fri, Aug 09, 2019 at 01:48:42AM -0400, Jason Wang wrote:
> Hi all:
> 
> This series try to fix several issues introduced by meta data
> accelreation series. Please review.
> 
> Changes from V4:
> - switch to use spinlock synchronize MMU notifier with accessors
> 
> Changes from V3:
> - remove the unnecessary patch
> 
> Changes from V2:
> - use seqlck helper to synchronize MMU notifier with vhost worker
> 
> Changes from V1:
> - try not use RCU to syncrhonize MMU notifier with vhost worker
> - set dirty pages after no readers
> - return -EAGAIN only when we find the range is overlapped with
>   metadata
> 
> Jason Wang (9):
>   vhost: don't set uaddr for invalid address
>   vhost: validate MMU notifier registration
>   vhost: fix vhost map leak
>   vhost: reset invalidate_count in vhost_set_vring_num_addr()
>   vhost: mark dirty pages during map uninit
>   vhost: don't do synchronize_rcu() in vhost_uninit_vq_maps()
>   vhost: do not use RCU to synchronize MMU notifier with worker
>   vhost: correctly set dirty pages in MMU notifiers callback
>   vhost: do not return -EAGAIN for non blocking invalidation too early
> 
>  drivers/vhost/vhost.c | 202 +++++++++++++++++++++++++-----------------
>  drivers/vhost/vhost.h |   6 +-
>  2 files changed, 122 insertions(+), 86 deletions(-)

This generally looks more solid.

But this amounts to a significant overhaul of the code.

At this point how about we revert 7f466032dc9e5a61217f22ea34b2df932786bbfc
for this release, and then re-apply a corrected version
for the next one?


> -- 
> 2.18.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
