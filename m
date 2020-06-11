Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E261F6674
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:19:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68E61895BA;
	Thu, 11 Jun 2020 11:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUv38TvTWN6z; Thu, 11 Jun 2020 11:18:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC72F895B3;
	Thu, 11 Jun 2020 11:18:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98280C016F;
	Thu, 11 Jun 2020 11:18:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67A6BC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 50F6687996
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVbC5TsCLa9F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:18:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 86A6887995
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591874332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aHs/k82DRtmbgpcekLlfLtqDNjfmaiN8XJYIsbpXYsw=;
 b=CvBQeXuFhPjyEKg+S+0DkKEKZx+hfjycYpJDGQgs3Xq6W3ZwY1YT4vxO9hN2ptXLnDS7lr
 /WhLjNHM4gW0mEj8+uHcFQ1r13/RdKi2DYN1Ipld9jn3nUpB9BKFBZuWEh6iHxt9r5lVrm
 w0wjRJeyqOP4J2JAd0VHgsWF9BXhCMw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265--LXwtwXKO9-yrrH3oTxjOQ-1; Thu, 11 Jun 2020 07:18:50 -0400
X-MC-Unique: -LXwtwXKO9-yrrH3oTxjOQ-1
Received: by mail-wm1-f69.google.com with SMTP id p24so1222538wmc.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 04:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aHs/k82DRtmbgpcekLlfLtqDNjfmaiN8XJYIsbpXYsw=;
 b=Hoar4TNHaXuh52T0PXEys94yQFE4HT3AksZGVqhvOt9bSQwk2TSSHNZC3tzICgBLU7
 bzJhFW9U+8YqWJ6Z45SQOoC2CwIyO62Ub5D2uCimlYvs63Y2UpuJdEMQ5cBqzesqvM3Z
 AHLEmTPF3qeIszibINq2e3FTmxgwu/i2eJyb3GWCeLLXsK5HMHisQfdZZFgzRNv8c7Nx
 32ZV6MDgVyahjo2YAhBU47y6y0/cI2hGGZWCLMialtcO3A8UUXJc+dm/ujEjIwPtqRLf
 YoV2Fg5zBlzUw2niy/DDJt0mRSlwVWlveara5vXg4ynRRODgaYd9suePvMzM8CjH3n3c
 +kLw==
X-Gm-Message-State: AOAM531PWZ8jCnVjh9CkDDlP+tBuw64x2ICMF/I6FFZz5U0Gvu8Fy2lg
 AXaD5NdGp4nHFPr3yH7oVC2JhlYXw4dSePeHAqKpJ9TFnLH2m+VIFC6H6x4+FVm+L3TbiR+XNMz
 haZDTYv749K0CL2/rwT4Hu+5rl0pJFJrecok4iQeQgA==
X-Received: by 2002:a5d:4008:: with SMTP id n8mr8881548wrp.82.1591874329748;
 Thu, 11 Jun 2020 04:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhY9t8eWTFTFU22DEN3RpHOgBvqdz12LnsClmOERlrFjUovn0BcztQcQ+mkBp5lkPjBXyAsg==
X-Received: by 2002:a5d:4008:: with SMTP id n8mr8881507wrp.82.1591874329286;
 Thu, 11 Jun 2020 04:18:49 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id z25sm3678047wmf.10.2020.06.11.04.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:18:48 -0700 (PDT)
Date: Thu, 11 Jun 2020 07:18:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] virtio-mem: add memory via add_memory_driver_managed()
Message-ID: <20200611071744-mutt-send-email-mst@kernel.org>
References: <20200611093518.5737-1-david@redhat.com>
 <20200611060249-mutt-send-email-mst@kernel.org>
 <13ad9edf-31a1-35ee-a0b0-6390c3a0b4d9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <13ad9edf-31a1-35ee-a0b0-6390c3a0b4d9@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 teawater <teawaterz@linux.alibaba.com>
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

On Thu, Jun 11, 2020 at 01:00:24PM +0200, David Hildenbrand wrote:
> >> I'd like to have this patch in 5.8, with the initial merge of virtio-mem
> >> if possible (so the user space representation of virtio-mem added memory
> >> resources won't change anymore).
> > 
> > So my plan is to rebase on top of -rc1 and merge this for rc2 then.
> > I don't like rebase on top of tip as the results are sometimes kind of
> > random.
> 
> Right, I just wanted to get this out early so we can discuss how to proceed.
> 
> > And let's add a Fixes: tag as well, this way people will remember to
> > pick this.
> > Makes sense?
> 
> Yes, it's somehow a fix (for kexec). So
> 
> Fixes: 5f1f79bbc9e26 ("virtio-mem: Paravirtualized memory hotplug")
> 
> I can respin after -rc1 with the commit id fixed as noted by Pankaj.
> Just let me know what you prefer.
> 
> Thanks!

Some once this commit is in Linus' tree, please ping me.

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
