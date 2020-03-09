Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EA59117DD54
	for <lists.virtualization@lfdr.de>; Mon,  9 Mar 2020 11:24:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 30CCE87BFE;
	Mon,  9 Mar 2020 10:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arNzk7xeDZTa; Mon,  9 Mar 2020 10:24:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6638187BC0;
	Mon,  9 Mar 2020 10:24:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D4BBC0177;
	Mon,  9 Mar 2020 10:24:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B768C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 10:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 59BA286341
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 10:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AaTwRRQfsLxn
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 10:24:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0241F85B4D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 10:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583749474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dvgDdAy0zWidzBgy80Pgtcr4prXz51m6ojJnNdb1JlQ=;
 b=iIpOqRFikA0I0sgvK3DWyDQ8sCqG91BQlCfBD1GSOhCxFFYGJu0+Zw2pnWf1hIIJLxX2Pg
 PfGFTbb3TH94IhQ3PEl3H7Ud9JzNEE4bDl2f7qba8J4Z08eSQXp/aZpjF1waIqkMnPdPnu
 fByYDpzz5lhy3L7MzI1OxrBx2ixhwdA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-_-rXng5CPPuXS2bcLODxjw-1; Mon, 09 Mar 2020 06:24:31 -0400
X-MC-Unique: _-rXng5CPPuXS2bcLODxjw-1
Received: by mail-qt1-f197.google.com with SMTP id k20so6462597qtm.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Mar 2020 03:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dvgDdAy0zWidzBgy80Pgtcr4prXz51m6ojJnNdb1JlQ=;
 b=mHIRQFAcvUhGpLHPV1huj1pfhzDYCXmzPC/RiXaJKNYtwnr7AkRfAoV7nj+7h5bWNv
 OVBM+qaQWAAZsfGKdm+2M0qimg6U7Knb0cMul53fJxZDWzJJf0Kw3sBuoU/6HW0ayw4r
 LA/4jL8Plgx40/mOby0r4N9qfFdIFlZAy2KXJvVYFOpCVAyceRJ98CChvJo9KPqfX117
 u3N3xhCqMrl8zNxH+cYzwQ8GMA0Ww9TN4h7HccFqeibSZ9hFWJOhCLRUP5evAFwSxD7E
 9QtoPIvg5VfjeYoCk+xtxhkAP/Ahkn8Aa4HbnI9F/2pL1Cn7M/g8UO0gOUbqOOEwh5qm
 GtMQ==
X-Gm-Message-State: ANhLgQ2Fd5zqjL1Ivn5xycrWlDqx1y2vmePrEJ0O/60VtP5vjygu6UII
 Sj6CwwxxABEF8W7jOTYe8/GTuEeqg0kBbd8/YZfVk86gFWM+4K/EhtoYpNKEUhsLOFv2W0DLyRr
 C5xe5ajESZJlxP7EEpfKFYn7Yw/SSOLi2MHqudvepmw==
X-Received: by 2002:a0c:b757:: with SMTP id q23mr13919344qve.213.1583749470560; 
 Mon, 09 Mar 2020 03:24:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs94BstrUypTvkiq+ZB1SWuvp4PA0n76GPDFRgcGKLKhcm6kiXzdCnIcquLiXGnqsLFDRSIzg==
X-Received: by 2002:a0c:b757:: with SMTP id q23mr13919333qve.213.1583749470343; 
 Mon, 09 Mar 2020 03:24:30 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id n5sm21958459qkk.121.2020.03.09.03.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 03:24:29 -0700 (PDT)
Date: Mon, 9 Mar 2020 06:24:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tyler Sanderson <tysand@google.com>
Subject: Re: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200309062311-mutt-send-email-mst@kernel.org>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
 <f31eff75-b328-de41-c2cc-e55471aa27d8@redhat.com>
 <20200216044641-mutt-send-email-mst@kernel.org>
 <CAJuQAmqmOQMx3A8g81pnFLyTZ5E5joSCEGG5fBwPOBH7crdi2w@mail.gmail.com>
 <CAJuQAmphPcfew1v_EOgAdSFiprzjiZjmOf3iJDmFX0gD6b9TYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJuQAmphPcfew1v_EOgAdSFiprzjiZjmOf3iJDmFX0gD6b9TYQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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

On Sat, Mar 07, 2020 at 08:47:25PM -0800, Tyler Sanderson wrote:
> Tested-by: Tyler Sanderson <tysand@google.com>
> 
> Test setup: VM with 16 CPU, 64GB RAM. Running Debian 10. We have a 42
> GB file full of random bytes that we continually cat to /dev/null.
> This fills the page cache as the file is read. Meanwhile we trigger
> the balloon to inflate, with a target size of 53 GB. This setup causes
> the balloon inflation to pressure the page cache as the page cache is
> also trying to grow. Afterwards we shrink the balloon back to zero (so
> total deflate = total inflate).
> 
> Without patch (kernel 4.19.0-5):
> Inflation never reaches the target until we stop the "cat file >
> /dev/null" process. Total inflation time was 542 seconds. The longest
> period that made no net forward progress was 315 seconds (see attached
> graph).
> Result of "grep balloon /proc/vmstat" after the test:
> balloon_inflate 154828377
> balloon_deflate 154828377
> 
> With patch (kernel 5.6.0-rc4+):
> Total inflation duration was 63 seconds. No deflate-queue activity
> occurs when pressuring the page-cache.
> Result of "grep balloon /proc/vmstat" after the test:
> balloon_inflate 12968539
> balloon_deflate 12968539
> 
> Conclusion: This patch fixes the issue. In the test it reduced
> inflate/deflate activity by 12x, and reduced inflation time by 8.6x.
> But more importantly, if we hadn't killed the "grep balloon
> /proc/vmstat" process then, without the patch, the inflation process
> would never reach the target.
> 
> Attached is a png of a graph showing the problematic behavior without
> this patch. It shows deflate-queue activity increasing linearly while
> balloon size stays constant over the course of more than 8 minutes of
> the test.

OK this is now queued for -next. Tyler thanks a lot for the detailed
test report - it's really awesome! I included it in the commit log in
full so that if we need to come back to this it's easy to reproduce the
testing.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
