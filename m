Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3DF17DD10
	for <lists.virtualization@lfdr.de>; Mon,  9 Mar 2020 11:15:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A20B687C0D;
	Mon,  9 Mar 2020 10:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYtoUSijKThz; Mon,  9 Mar 2020 10:15:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA91687B77;
	Mon,  9 Mar 2020 10:15:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC519C0177;
	Mon,  9 Mar 2020 10:15:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FE87C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 10:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 46345882CB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 10:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEsOixCz9PBA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 10:15:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4AA7886123
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583748903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=77GwOo3dJvMMY5EsUFtosa5OLtVohxUzfDzSlHPcPtQ=;
 b=FWm5ApN386cb+pwhYw10WgzwAANosnFk3z2TUkVd2mzrnS+ZDHNJcZEmoQeVdU2ONvpaT0
 fR+RdVycpCPEYmH4HBKUxHhlrEJquHcUqZw5+q6ml6Gz3+Jb07cqoVap2BQz5vdNuCWjk/
 hBYs/K2AcnhVapZ/B+P0+Zqcpmspaf8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-qlZN2NgdNW21-hIP5JqNOQ-1; Mon, 09 Mar 2020 06:15:02 -0400
X-MC-Unique: qlZN2NgdNW21-hIP5JqNOQ-1
Received: by mail-qk1-f197.google.com with SMTP id e10so364285qkg.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Mar 2020 03:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=77GwOo3dJvMMY5EsUFtosa5OLtVohxUzfDzSlHPcPtQ=;
 b=FbbkwwvR/5f1GZAnAtLI1IGNBATkV2hxhOZ77ym8eraa/kRBlQn1Jld3qsvkY86XLy
 XXcEI8OBazJnofnQpn8X97I8dC537KP4ARd5YN7dgVHbAOSoX1H/oXuNepTP2iCGdxuF
 11yQa2e3fnfPNLmJ9I9ShzB4rClN/yvdegUaWbTSpsSYo5lIWH6VO6jJWtf8LKaQA9EH
 mmwOxq+On3HQS5HbNWAlLUwZWqpaCPu1fonDGFAOFZJEdA/YFU65jnuJYv2ReHVt+O8C
 0VTUOJRjpum4ldHuicSwZ8JKGfIBxw7HMdb3YhRzBBdCJqup+07U4Fcaln27kPFzIqY+
 l9sg==
X-Gm-Message-State: ANhLgQ2Ul82+d6GIJ2YAUK46ENhqvhimaoManot5ajbTFs+NoejaLNTs
 QWEBQU0O7RigGQ/zMZNebfEEGUKjTixXI2s/z9i2ltwkVfWfqsxnwl4GDMEQNUuf6tAqI4TiazC
 +Nmyc1voGjh5O0kfMsXsrdQ9huxAQRMmIbEYpbVBtJA==
X-Received: by 2002:a05:620a:45:: with SMTP id
 t5mr14504894qkt.183.1583748901946; 
 Mon, 09 Mar 2020 03:15:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtfD5xstQ+O6d+qn8lUbNErH2WtviwPZFrpi5EEEd3e9u07levRrO15iYSkAMgTmNP7vp20Mw==
X-Received: by 2002:a05:620a:45:: with SMTP id
 t5mr14504877qkt.183.1583748901718; 
 Mon, 09 Mar 2020 03:15:01 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id 184sm5164615qkh.63.2020.03.09.03.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 03:15:00 -0700 (PDT)
Date: Mon, 9 Mar 2020 06:14:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200309061403-mutt-send-email-mst@kernel.org>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
 <f31eff75-b328-de41-c2cc-e55471aa27d8@redhat.com>
 <20200216044641-mutt-send-email-mst@kernel.org>
 <CAJuQAmqmOQMx3A8g81pnFLyTZ5E5joSCEGG5fBwPOBH7crdi2w@mail.gmail.com>
 <CAJuQAmphPcfew1v_EOgAdSFiprzjiZjmOf3iJDmFX0gD6b9TYQ@mail.gmail.com>
 <86453fed-1f39-dfcc-33c6-54241478e2ab@redhat.com>
MIME-Version: 1.0
In-Reply-To: <86453fed-1f39-dfcc-33c6-54241478e2ab@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Tyler Sanderson <tysand@google.com>, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
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

On Mon, Mar 09, 2020 at 10:03:14AM +0100, David Hildenbrand wrote:
> On 08.03.20 05:47, Tyler Sanderson wrote:
> > Tested-by: Tyler Sanderson <tysand@google.com>
> > 
> > Test setup: VM with 16 CPU, 64GB RAM. Running Debian 10. We have a 42
> > GB file full of random bytes that we continually cat to /dev/null.
> > This fills the page cache as the file is read. Meanwhile we trigger
> > the balloon to inflate, with a target size of 53 GB. This setup causes
> > the balloon inflation to pressure the page cache as the page cache is
> > also trying to grow. Afterwards we shrink the balloon back to zero (so
> > total deflate = total inflate).
> > 
> > Without patch (kernel 4.19.0-5):
> > Inflation never reaches the target until we stop the "cat file >
> > /dev/null" process. Total inflation time was 542 seconds. The longest
> > period that made no net forward progress was 315 seconds (see attached
> > graph).
> > Result of "grep balloon /proc/vmstat" after the test:
> > balloon_inflate 154828377
> > balloon_deflate 154828377
> > 
> > With patch (kernel 5.6.0-rc4+):
> > Total inflation duration was 63 seconds. No deflate-queue activity
> > occurs when pressuring the page-cache.
> > Result of "grep balloon /proc/vmstat" after the test:
> > balloon_inflate 12968539
> > balloon_deflate 12968539
> > 
> > Conclusion: This patch fixes the issue. In the test it reduced
> > inflate/deflate activity by 12x, and reduced inflation time by 8.6x.
> > But more importantly, if we hadn't killed the "grep balloon
> > /proc/vmstat" process then, without the patch, the inflation process
> > would never reach the target.
> > 
> > Attached is a png of a graph showing the problematic behavior without
> > this patch. It shows deflate-queue activity increasing linearly while
> > balloon size stays constant over the course of more than 8 minutes of
> > the test.
> 
> Thanks a lot for the extended test!


Given we shipped this for a long time, I think the best way
to make progress is to merge 1/3, 2/3 right now, and 3/3
in the next release.

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
