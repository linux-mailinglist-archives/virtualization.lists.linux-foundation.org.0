Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F187AEC009
	for <lists.virtualization@lfdr.de>; Fri,  1 Nov 2019 09:51:28 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BD0DE3EC5;
	Fri,  1 Nov 2019 08:51:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7CAAAFD9
	for <virtualization@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 08:51:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1916363D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572598278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=5ktp9lhDtVKvIHfR99rgDCIdSp2yeuZotk6sUT/R7FA=;
	b=f4cqk5UXELfh9xSuJWUBI13iaX21Un79BAWCSYzRPmwSsHdIHZ2CexsTWQRfEnCW1I7c8N
	ToCR52CnM0OcEjOP1A3/8k/vGc8ve+LLM+lT95h1bIP5RtXia8KjlA+WWNnjZXgvv7c+Uy
	buN3VBMaYn8Vi3bVoHbvXU8t+Ow0h8o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-42--PBEZtvAODyLO06MYsCidA-1; Fri, 01 Nov 2019 04:51:15 -0400
Received: by mail-qt1-f198.google.com with SMTP id q54so9210165qtk.15
	for <virtualization@lists.linux-foundation.org>;
	Fri, 01 Nov 2019 01:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=P5XOZGyw2oG7H0SnvrpnKTJA5LnJvwTZ0jVxtaaPC4g=;
	b=pcfUkBWkEDyD2gDKdTiezE0+TD0LbkBdA39Kp78mkqKjr+7UirjLdc8JOEFtQq/bSx
	Phea0ozN+Qk9QhLljGYqfxT6VvWAYVunNPZyYDsXz7cIpBwy1712lwt8bjoeIEjy3k3+
	d6vqzXbSJE0zGXcwhxGfI9HEciiOzI0VWbX/4avbtAYfX/AqGUNDrcR/8uhj5J96O6LC
	YfIuONFFtUsclrAo8DuIIZJJFm6F37171MtfEb7ipg7XxQzxUm+OiVYW4TUi69QJ8UU6
	1KG29pfTzv6yv+lEbx2lnA0aFnX9R5PBD/o9mKgMVea7TPIhFZllkmMgppE80AN29OJ4
	SgNA==
X-Gm-Message-State: APjAAAXSYtOkspqxI/f9Os20i5yaEaxyZUYttOlNSXR7VPj4lqd8BDDX
	HVvQ0RcGHIfL2lhptAQlLxpE9s1VJGYJ+rHWdP87aS6Ytftuu2foMBXzby4bpMTQ19OcD+xFYZJ
	d9uWh70CqIhjaLTEWa2CcUHpOOTKrMDrOZhNfi4uhPA==
X-Received: by 2002:a37:4ccb:: with SMTP id z194mr1660269qka.128.1572598275218;
	Fri, 01 Nov 2019 01:51:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznVLmhcvqDP9+wbCuzkX2TVWL1sCyMMrKm8HTrClFL3Is3yNefPoiinVdvNFThvIqtAV7wqA==
X-Received: by 2002:a37:4ccb:: with SMTP id z194mr1660256qka.128.1572598274910;
	Fri, 01 Nov 2019 01:51:14 -0700 (PDT)
Received: from redhat.com ([91.217.168.176]) by smtp.gmail.com with ESMTPSA id
	h23sm3910913qkk.56.2019.11.01.01.51.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 01:51:13 -0700 (PDT)
Date: Fri, 1 Nov 2019 04:51:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org
Subject: Re: presentation at kvm forum and pagefaults
Message-ID: <20191101044700-mutt-send-email-mst@kernel.org>
References: <20191031234601-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191031234601-mutt-send-email-mst@kernel.org>
X-MC-Unique: -PBEZtvAODyLO06MYsCidA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

On Fri, Nov 01, 2019 at 12:07:01AM -0400, Michael S. Tsirkin wrote:
> Regarding the presentation I gave at the kvm forum
> on pagefaults.
> 
> Two points:
> 
> 
> 1. pagefaults are important not just for migration.
> They are important for performance features such as
> autonuma and huge pages, since this relies on moving
> pages around.
> Migration can maybe be solved by switch to software but
> this is not a good solution for numa and thp  since
> at a given time some page is likely being moved.
> 

Also, pagefaults might allow iommu page table shadowing to scale better
to huge guests. As in, the host IOMMU page tables can be populated
lazily on fault. I'm not sure what the performance of such an approach
would be though, but this space might be worth exploring.


> 
> 
> 
> 2.  For devices such as networking RX order in which buffers are
> used *does not matter*.
> Thus if a device gets a fault in response to attempt to store a buffer
> into memory, it can just re-try, using the next buffer in queue instead.
> 
> This works because normally buffers can be used out of order by device.
> 
> The faulted buffer will be reused by another buffer when driver notifies
> device page has been faulted in.
> 
> Note buffers are processed by buffer in the order in which they have
> been used, *not* the order in which they have been put in the queue.  So
> this will *not* cause any packet reordering for the driver.
> 
> Packets will only get dropped if all buffers are swapped
> out, which should be rare with a large RX queue.
> 
> 
> As I said at the forum, a side buffer for X packets
> to be stored temporarily is also additionally possible. But with the above
> it is no longer strictly required.
> 
> 
> This conflicts with the IN_ORDER feature flag, I guess we will have to
> re-think this flag then. If we do feel we need to salvage IN_ORDER as is,
> maybe device can use the buffer with length 0 and driver will re-post it
> later, but I am not I am not sure about this since involving the VF
> driver seems inelegant.
> 
> -- 
> MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
