Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750E287D11
	for <lists.virtualization@lfdr.de>; Thu,  8 Oct 2020 22:27:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B07AB86E89;
	Thu,  8 Oct 2020 20:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mITIsXqUu0Ag; Thu,  8 Oct 2020 20:27:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D0F1586E82;
	Thu,  8 Oct 2020 20:27:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7910C0051;
	Thu,  8 Oct 2020 20:27:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EDA5C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 20:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 20DD487168
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 20:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kg2ECnsZo1k
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 20:27:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CCC808715E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602188818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=twVz8zn39JFNygX3N+DpgBYsBehN6K5Zd/Llqp3b+sk=;
 b=RG7U9gUpDFn1E80s8YPI3yxgju33yHzxae/uBhbIhfa2kU1qCA9UiZrulN5NHvTCONoK6P
 LVRYjlZZLfF4r3/GxLKPu9CXe5WWHeblSeLjFhoyos5sPjv6PtDEQ8JG0b46nuwnNDoOSc
 Ure/DqLhPGQ6ebmB3EnAzg0olMbuNQs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-yj0V8x5nPTmvfUX9xCbuMg-1; Thu, 08 Oct 2020 16:26:56 -0400
X-MC-Unique: yj0V8x5nPTmvfUX9xCbuMg-1
Received: by mail-wm1-f71.google.com with SMTP id 13so3519308wmf.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 08 Oct 2020 13:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=twVz8zn39JFNygX3N+DpgBYsBehN6K5Zd/Llqp3b+sk=;
 b=nnRQUME8Nj8samG35Z6H/B+mR20dJWidLmINj1cEs/RlRUJJF/HHeYVIS4SUZ+1NGg
 oD9PxzW/m5QvLHfQ7guyCPvrKtJ54iYgZ2bJ++MzFqGAztCRWkkjEIYZEqikyBCjRZ6g
 BK+Wjr1wDkJxoRG1LyyIZgStKi71BiRi8QIr1rS4EggcSgAHiZJS1dlxIEWeefhDIuRC
 SMDjc34x231AZ6SvD1aTnpdDBqw+LDBrOkZtQ/hM3f4bLYsB7T9GYyH/ZwXCk5oLzOg2
 RzDuex4GxoiHgMTzTPsGGfR4KVZ630pykxJBS4cPDRtw6nYhP+6fLCKTK+PAsutVGpAb
 5dMA==
X-Gm-Message-State: AOAM530E7Uana81+qEGYBMARGRssR2RME5M5YBh3b0Uhq7hOcPjPs5j+
 nRIEDFI+YgP8lHtvWrQf2VQc0Ks6+Czdvc381bETJmkIWlhcvzW5cVRQh4g/TM+Yht8M98RR3ET
 s/5YQB9iL0UQuQIycdCmBJohfxnFUuYlhnhqg2URVaw==
X-Received: by 2002:a7b:cc17:: with SMTP id f23mr9940716wmh.166.1602188815246; 
 Thu, 08 Oct 2020 13:26:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3KfXXvkMS5m5z/HtHdSxRswCK5ykunjW1kWHIj15VRre8iCzBqPKFXNiyvij71iupd9gn4A==
X-Received: by 2002:a7b:cc17:: with SMTP id f23mr9940704wmh.166.1602188815005; 
 Thu, 08 Oct 2020 13:26:55 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id a199sm8942819wmd.8.2020.10.08.13.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 13:26:54 -0700 (PDT)
Date: Thu, 8 Oct 2020 16:26:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 12/16] vhost: support multiple worker threads
Message-ID: <20201008162523-mutt-send-email-mst@kernel.org>
References: <1602104101-5592-1-git-send-email-michael.christie@oracle.com>
 <1602104101-5592-13-git-send-email-michael.christie@oracle.com>
 <da6f25b4-7a98-9294-a987-43d100625499@oracle.com>
MIME-Version: 1.0
In-Reply-To: <da6f25b4-7a98-9294-a987-43d100625499@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 stefanha@redhat.com, pbonzini@redhat.com
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

On Thu, Oct 08, 2020 at 12:56:53PM -0500, Mike Christie wrote:
> On 10/7/20 3:54 PM, Mike Christie wrote:
> > This is a prep patch to support multiple vhost worker threads per vhost
> > dev. This patch converts the code that had assumed a single worker
> > thread by:
> > 
> > 1. Moving worker related fields to a new struct vhost_worker.
> > 2. Converting vhost.c code to use the new struct and assume we will
> > have an array of workers.
> > 3. It also exports a helper function that will be used in the last
> > patch when vhost-scsi is converted to use this new functionality.
> > 
> 
> Oh yeah I also wanted to bring up this patch:
> 
> https://www.spinics.net/lists/netdev/msg192548.html
> 
> The problem with my multi-threading patches is that I was focused on
> the cgroup support parts and that lead to some gross decisions.
> 
> 1. I kept the cgroup support, but as a result I do not have control
> over the threading affinity and making sure cmds are executed on a
> optimal CPU like the above patches do.
> 
> When I drop the cgroup support and make sure threads are bound to
> specific CPUs and then make sure IO is run on the CPU it came in on
> then IOPs jumps from 600K to 800K for vhost-scsi.
> 
> 2. I can possible create a lot of threads.
> 
> So a couple open issues are:
> 
> 1. Can we do a thread per cpu that is shared across all vhost devices?
> That would lead to dropping the cgroup vhost worker support.
> 
> 2. Can we just use the kernel's workqueues then?


Problem is, we are talking about *lots* of CPU, IO etc and ATM cgroups
is how people expect to account for that overhead.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
