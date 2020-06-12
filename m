Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0E1F7DE8
	for <lists.virtualization@lfdr.de>; Fri, 12 Jun 2020 22:03:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E82488C0C;
	Fri, 12 Jun 2020 20:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MNn-ilVwZ2g; Fri, 12 Jun 2020 20:03:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDE0688C0A;
	Fri, 12 Jun 2020 20:03:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3DB2C089E;
	Fri, 12 Jun 2020 20:03:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9A3BC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 20:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D0D8388C0D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 20:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQYvXQMUHEDq
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 20:03:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3D73E88C11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 20:03:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ee3df4d0000>; Fri, 12 Jun 2020 13:02:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 12 Jun 2020 13:03:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 12 Jun 2020 13:03:07 -0700
Received: from [10.2.62.89] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jun
 2020 20:03:07 +0000
Subject: Re: [PATCH 1/2] docs: mm/gup: pin_user_pages.rst: add a "case 5"
To: Matthew Wilcox <willy@infradead.org>
References: <20200529234309.484480-1-jhubbard@nvidia.com>
 <20200529234309.484480-2-jhubbard@nvidia.com>
 <20200612192426.GK8681@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <d717e596-4ac7-9350-8734-379852c151d2@nvidia.com>
Date: Fri, 12 Jun 2020 13:03:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612192426.GK8681@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591992141; bh=fN6zAnkb8dRIBQrks+Oz4+vRiYcHSYaYUuw0BewGGEk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Mrwrs2/WN8fnEejZcAvFi1E+ICWIQc+5sT7wEIyruy1+L8O2vF2rU8etd+2m3Rcye
 /0MGen72j1T2YMz8qzXatSCP76QXdLxycn/9MxrzFz+r0k+oGKr5wqPp43sFbsvvxJ
 kG6DIrwJ31WVrfLqK6RrOt/FtCmOVWN8cByBMW2OYkwN5lYUueiqAzGuWU0cmQv94Q
 Uvvv505bPXRH5YPkRvyIKX1owhLczul7/YDNdthyhbC86t0EtjEp8X1e75YFPqEGn9
 iBucQvKo4smd+Vzmm9MOxV5oQ6ufLiUCUz2qRrkZ0AZiZ94MfBBuULhA48FkMlAfRC
 xpX4UyB4FOplg==
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dave Chinner <david@fromorbit.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 2020-06-12 12:24, Matthew Wilcox wrote:
> On Fri, May 29, 2020 at 04:43:08PM -0700, John Hubbard wrote:
>> +CASE 5: Pinning in order to write to the data within the page
>> +-------------------------------------------------------------
>> +Even though neither DMA nor Direct IO is involved, just a simple case of "pin,
>> +access page's data, unpin" can cause a problem. Case 5 may be considered a
>> +superset of Case 1, plus Case 2, plus anything that invokes that pattern. In
>> +other words, if the code is neither Case 1 nor Case 2, it may still require
>> +FOLL_PIN, for patterns like this:
>> +
>> +Correct (uses FOLL_PIN calls):
>> +    pin_user_pages()
>> +    access the data within the pages
>> +    set_page_dirty_lock()
>> +    unpin_user_pages()
>> +
>> +INCORRECT (uses FOLL_GET calls):
>> +    get_user_pages()
>> +    access the data within the pages
>> +    set_page_dirty_lock()
>> +    put_page()
> 
> Why does this case need to pin?  Why can't it just do ...
> 
> 	get_user_pages()
> 	lock_page(page);
> 	... modify the data ...
> 	set_page_dirty(page);
> 	unlock_page(page);
> 

Yes, it could do that. And that would also make a good additional "correct"
example. Especially for the case of just dealing with a single page,
lock_page() has the benefit of completely fixing the problem *today*,
without waiting for the pin_user_pages*() handling improvements to get
implemented.

And it's also another (probably better) way to fix the vhost.c problem, than
commit 690623e1b496 ("vhost: convert get_user_pages() --> pin_user_pages()").

I'm inclined to leave vhost.c alone for now, unless someone really prefers
it to be changed, but to update the Case 5 documentation with your point
above. Sound about right?


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
