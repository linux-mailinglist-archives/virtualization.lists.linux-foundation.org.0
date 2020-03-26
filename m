Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C00193984
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 08:21:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 68A0E2151F;
	Thu, 26 Mar 2020 07:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkIecDKd9DlS; Thu, 26 Mar 2020 07:21:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A700420440;
	Thu, 26 Mar 2020 07:21:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BC14C0177;
	Thu, 26 Mar 2020 07:21:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20861C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1D06187F9C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I27sHRW1znWX
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:21:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8271A87E68
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585207282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4XWknPyKkYAfbqizFNt1Gd0mfkxXVUcGvQWw0e8F7fs=;
 b=C/cK0evNah8jy7t+Ntri4P6a1gWGIQ8Tj3ChEa1QLjMg3cJOmpXNUdelWaaL5tm1whFHCQ
 0ia6ZzSeB2yAbaNXsBo5whEfqfWMtYZehxjaYV5KjVDWwQeCPL3LKfvhfpg3zw0NbGpjbe
 270oBdvO9uFa2WOOlcw7MaMa2Pnewt0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-hvB1ZhC_PXeYQO-EmxenNg-1; Thu, 26 Mar 2020 03:20:39 -0400
X-MC-Unique: hvB1ZhC_PXeYQO-EmxenNg-1
Received: by mail-wr1-f72.google.com with SMTP id b2so2151331wrq.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 00:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4XWknPyKkYAfbqizFNt1Gd0mfkxXVUcGvQWw0e8F7fs=;
 b=sSiec7b9oVPyW/DG7dXx4Xjh1P+XHCzeQT6/VSLLGwYte6YF6eUjVd9qeDrXXCq0XQ
 sdVO8sUA39QAJVXCRevIO6IyAuHAyw8Z92ZaTYP1jYywew3VIwPxKnqW5hIV4En0OzwL
 9gFY3BbdK5LU8BrRRWHIJqhVKFpAvolb+q8tfg/ci0856DVwEsrSxl3DBrIg3RIOAWCR
 ZKKBPLXoT+lpJrkRH4W4BnTGdKo+2EmDr4o5a+sp/aGSxHAidHdcIWco9aY8MMYOlhUS
 /EeJLqp38/G3Bmt2P8q2CNywEkypq52T0Gh4axOFCAUxd911yZMPCSXgDRsB0tVV50nT
 6TYw==
X-Gm-Message-State: ANhLgQ0tvB2gp8dn6pQdChc18eRzc0tXz7QKgYLMJPqLYmOOOLEf+khF
 TdfRGNFGMgVJaEz5n7u8PPp358DYUgiLcB5Xf+dQwQ6lUZcf1lcwvhIe7cRCE0bMygPVFcNjuiO
 v+fkX4loR49mXsLsPIkrpRQSUbciMhrjT0zDaKeOw7w==
X-Received: by 2002:adf:a348:: with SMTP id d8mr7659490wrb.83.1585207238150;
 Thu, 26 Mar 2020 00:20:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vulLKViL6lz98C0rMEOGStoYAVS4PIbCmp8QYl/VaQLfO8diHChBT/rYUPUuQ2COQGUsrv+DA==
X-Received: by 2002:adf:a348:: with SMTP id d8mr7659463wrb.83.1585207237880;
 Thu, 26 Mar 2020 00:20:37 -0700 (PDT)
Received: from redhat.com (bzq-79-182-20-254.red.bezeqint.net. [79.182.20.254])
 by smtp.gmail.com with ESMTPSA id r3sm2300372wrm.35.2020.03.26.00.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 00:20:37 -0700 (PDT)
Date: Thu, 26 Mar 2020 03:20:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200326031817-mutt-send-email-mst@kernel.org>
References: <1583999395-9131-1-git-send-email-teawater@gmail.com>
 <3e1373f4-6ade-c651-ddde-6f04e78382f9@redhat.com>
 <20200312043859-mutt-send-email-mst@kernel.org>
 <45756694-560d-0276-d39e-cc2fd1c4e3a7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <45756694-560d-0276-d39e-cc2fd1c4e3a7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pagupta@redhat.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 qemu-devel@nongnu.org, mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 Hui Zhu <teawaterz@linux.alibaba.com>, akpm@linux-foundation.org,
 Hui Zhu <teawater@gmail.com>
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

On Thu, Mar 12, 2020 at 09:51:25AM +0100, David Hildenbrand wrote:
> On 12.03.20 09:47, Michael S. Tsirkin wrote:
> > On Thu, Mar 12, 2020 at 09:37:32AM +0100, David Hildenbrand wrote:
> >> 2. You are essentially stealing THPs in the guest. So the fastest
> >> mapping (THP in guest and host) is gone. The guest won't be able to make
> >> use of THP where it previously was able to. I can imagine this implies a
> >> performance degradation for some workloads. This needs a proper
> >> performance evaluation.
> > 
> > I think the problem is more with the alloc_pages API.
> > That gives you exactly the given order, and if there's
> > a larger chunk available, it will split it up.
> > 
> > But for balloon - I suspect lots of other users,
> > we do not want to stress the system but if a large
> > chunk is available anyway, then we could handle
> > that more optimally by getting it all in one go.
> > 
> > 
> > So if we want to address this, IMHO this calls for a new API.
> > Along the lines of
> > 
> > 	struct page *alloc_page_range(gfp_t gfp, unsigned int min_order,
> > 					unsigned int max_order, unsigned int *order)
> > 
> > the idea would then be to return at a number of pages in the given
> > range.
> > 
> > What do you think? Want to try implementing that?
> 
> You can just start with the highest order and decrement the order until
> your allocation succeeds using alloc_pages(), which would be enough for
> a first version. At least I don't see the immediate need for a new
> kernel API.

OK I remember now.  The problem is with reclaim. Unless reclaim is
completely disabled, any of these calls can sleep. After it wakes up,
we would like to get the larger order that has become available
meanwhile.


> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
