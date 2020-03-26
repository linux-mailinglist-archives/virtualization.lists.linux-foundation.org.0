Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A2882193961
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 08:10:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 417598837A;
	Thu, 26 Mar 2020 07:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FKZeYeb22ayG; Thu, 26 Mar 2020 07:10:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D5EF88393;
	Thu, 26 Mar 2020 07:10:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FC90C0177;
	Thu, 26 Mar 2020 07:10:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C8A3C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 16ED087099
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfDF0ZowFFK6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:10:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4AC0587097
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585206617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H8Cw3DLh+iXs54zjqQfuZxMBQva4d9GTteg9CmCE+Ho=;
 b=ZGhqshVCh86L7itMqAR4IP3ZWnjnzHwbzKAQfHGE2qRUYkkD5q9uHu5Xpx0JM8xeO50Xjk
 QElYSkImPIZiIBBeu9GK84SkEiCurgvu5GuDIjxFy0rs82MOa3sfD5KN/56YhBqRKd69P0
 2jxnDe4L+dWa+v4neigu6FSI4sQe3b8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-8Po4hadrN0qGwd_bseMvVQ-1; Thu, 26 Mar 2020 03:10:15 -0400
X-MC-Unique: 8Po4hadrN0qGwd_bseMvVQ-1
Received: by mail-wr1-f70.google.com with SMTP id v6so2544282wrg.22
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 00:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H8Cw3DLh+iXs54zjqQfuZxMBQva4d9GTteg9CmCE+Ho=;
 b=slWlBw3TJM4Y2C7gVLlAW+bwQ0EpkwehXKiN05KX7+IR6plJ5jvJ1NUIO6nWEW+cT0
 BAiWeV3AxhvxkGK2XKwqr1iltDwuRbTQoOr2GoiRpcly9PmOhsCaCLHmA9FQaF17hDEv
 LVn5GhMvnmYAoz0pD/YQjfw2bEPoM17+XKKeOQn9AfRO+yjHCD9ktvLzeKtdyhoyzUw6
 JKKiaa6okIJlXMIeQJjOiThvjdLWQT036naStaOwdZM+ofIqgW2B5T4WH06LTDDXbazM
 W1acEDRkOGHVPTUDaENV1AQH5g4eOirJt2+Mka1adlZo1dNUu9n1u9U2m9wDxx8ZvPCr
 rRrA==
X-Gm-Message-State: ANhLgQ0kN34SpnXeGDZlnx0UHyMEDVEFz5+tib3K/f584FQR6RIXudJg
 gxSKaBE+m6C19l1TFclZU8wxdocPEX1YtOBaaYOcmM3iWCSY1IVvQS+7ceh5OZ6n6AvDNuaCW23
 FU9WqwQcMcdb+P2Xskd/9rilxLhormpM8pLS6FcjI/Q==
X-Received: by 2002:a5d:4e03:: with SMTP id p3mr7455134wrt.408.1585206614577; 
 Thu, 26 Mar 2020 00:10:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv1gHKjELwCfzDpvvpY8bDWo2p7o6gD/1dLi9S0i1LgXWtQ35bOWK+dgA1kgl5Qn2fUPD9HnQ==
X-Received: by 2002:a5d:4e03:: with SMTP id p3mr7455094wrt.408.1585206614278; 
 Thu, 26 Mar 2020 00:10:14 -0700 (PDT)
Received: from redhat.com (bzq-79-182-20-254.red.bezeqint.net. [79.182.20.254])
 by smtp.gmail.com with ESMTPSA id y16sm2272355wrp.78.2020.03.26.00.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 00:10:13 -0700 (PDT)
Date: Thu, 26 Mar 2020 03:10:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200326030833-mutt-send-email-mst@kernel.org>
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

Well there's still a chance of splitting a big page if one
becomes available meanwhile. But OK.

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
