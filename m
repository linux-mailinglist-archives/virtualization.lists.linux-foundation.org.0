Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3EB0196
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 18:25:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7BD58E75;
	Wed, 11 Sep 2019 16:25:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A40A6E62
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 16:25:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6867C894
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 16:25:08 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E5A902085B;
	Wed, 11 Sep 2019 16:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568219108;
	bh=p51cKNYssjsGmMVYnMjF9WdcHjn+O5GRnUBJEET3Mz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOtgRvNLApk4EIvptVK8jURuwGqdAAz+5Loinkha9ukkM1thBGc22ksV4WI3LbviW
	nCXtSdSU9J66ITrDQ5jYxxazBQCAkmRqKj8SCT4gYFhZKMdTC8zdbV+jLi9jVK6ESK
	C+L7kLIMTHAevfkjMd0jT5IgQOl1PNRNzSx5QErM=
Date: Wed, 11 Sep 2019 17:25:04 +0100
From: Will Deacon <will@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] vhost: block speculation of translated descriptors
Message-ID: <20190911162503.em2ytox2iq5wdp3z@willie-the-truck>
References: <20190911120908.28410-1-mst@redhat.com>
	<20190911095147-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911095147-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: security@kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Wed, Sep 11, 2019 at 09:52:25AM -0400, Michael S. Tsirkin wrote:
> On Wed, Sep 11, 2019 at 08:10:00AM -0400, Michael S. Tsirkin wrote:
> > iovec addresses coming from vhost are assumed to be
> > pre-validated, but in fact can be speculated to a value
> > out of range.
> > 
> > Userspace address are later validated with array_index_nospec so we can
> > be sure kernel info does not leak through these addresses, but vhost
> > must also not leak userspace info outside the allowed memory table to
> > guests.
> > 
> > Following the defence in depth principle, make sure
> > the address is not validated out of node range.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > Tested-by: Jason Wang <jasowang@redhat.com>
> > ---
> 
> Cc: security@kernel.org
> 
> Pls advise on whether you'd like me to merge this directly,
> Cc stable, or handle it in some other way.

I think you're fine taking it directly, with a cc stable and a Fixes: tag.

Cheers,

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
