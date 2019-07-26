Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C12375C77
	for <lists.virtualization@lfdr.de>; Fri, 26 Jul 2019 03:24:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7DEBBD91;
	Fri, 26 Jul 2019 01:24:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 30B1FB43
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 01:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C9295224
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 01:24:17 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d3a563e0000>; Thu, 25 Jul 2019 18:24:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Thu, 25 Jul 2019 18:24:17 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Thu, 25 Jul 2019 18:24:17 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 26 Jul 2019 01:24:16 +0000
Subject: Re: [PATCH 00/12] block/bio, fs: convert put_page() to
	put_user_page*()
To: Bob Liu <bob.liu@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
	<8621066c-e242-c449-eb04-4f2ce6867140@oracle.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <88864b91-516d-9774-f4ca-b45927ac4556@nvidia.com>
Date: Thu, 25 Jul 2019 18:24:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8621066c-e242-c449-eb04-4f2ce6867140@oracle.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1564104254; bh=QKXKINFukbwLIIsnFYM0gxF2tKYcHndEGgwougXKa7I=;
	h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
	Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	Content-Transfer-Encoding;
	b=PQnzJX5xz5ikEiwrLKM8WsALivZ88h6rrpD5As08defMJIkdP+u4c4qNjj9VJ4tt7
	nwv4lirmE3zmhFpqjjtQZ51fomZqIx7+Z5K/hIMgtkne3B/lAraavguLY6SA4HXRUi
	W4SUZZlps8N4rFxPowCNQkldeoVK/fBECjRShYxjtzJx8yvDnyDgvLG3XjCMQgN0HE
	j0RlPZtSamPdX7GpRyHeIVO0klar+OAGzPGoJx+oiz7wZ/GbisDHnJkR/hoyBrvfQa
	+HuyKaWvKrWvHxopvgEQcRa8uv0hWn0N0u4M8vDDfrnuUHyPlJZxMytFt1GB3uPYBU
	1cdZ+M2GXGeqw==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>, linux-block@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
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

On 7/24/19 5:41 PM, Bob Liu wrote:
> On 7/24/19 12:25 PM, john.hubbard@gmail.com wrote:
>> From: John Hubbard <jhubbard@nvidia.com>
>>
>> Hi,
>>
>> This is mostly Jerome's work, converting the block/bio and related areas
>> to call put_user_page*() instead of put_page(). Because I've changed
>> Jerome's patches, in some cases significantly, I'd like to get his
>> feedback before we actually leave him listed as the author (he might
>> want to disown some or all of these).
>>
> 
> Could you add some background to the commit log for people don't have the context..
> Why this converting? What's the main differences?
> 

Hi Bob,

1. Many of the patches have a blurb like this:

For pages that were retained via get_user_pages*(), release those pages
via the new put_user_page*() routines, instead of via put_page().

This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
("mm: introduce put_user_page*(), placeholder versions").

...and if you look at that commit, you'll find several pages of
information in its commit description, which should address your point.

2. This whole series has to be re-worked, as per the other feedback thread.
So I'll keep your comment in mind when I post a new series.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
