Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F74A1E9D58
	for <lists.virtualization@lfdr.de>; Mon,  1 Jun 2020 07:31:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D274B89682;
	Mon,  1 Jun 2020 05:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lp5XtSPnPcIf; Mon,  1 Jun 2020 05:30:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 217568966B;
	Mon,  1 Jun 2020 05:30:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05604C0176;
	Mon,  1 Jun 2020 05:30:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83573C08A2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 653A786DCC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRus+tsy9ivc
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:15:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5D72E883BB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:11:50 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ed48dbf0000>; Sun, 31 May 2020 22:10:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 31 May 2020 22:11:50 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 31 May 2020 22:11:50 -0700
Received: from [10.2.56.10] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Jun
 2020 05:11:49 +0000
From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/2] docs: mm/gup: pin_user_pages.rst: add a "case 5"
To: Souptick Joarder <jrdr.linux@gmail.com>
References: <20200529234309.484480-1-jhubbard@nvidia.com>
 <20200529234309.484480-2-jhubbard@nvidia.com>
 <CAFqt6zaCSngh7-N_qZ6-S3Cj8CHF8DTSPv8anP_oJg5E6UWu9g@mail.gmail.com>
X-Nvconfidentiality: public
Message-ID: <b8de5a5e-b53a-81e8-9165-405d203deb33@nvidia.com>
Date: Sun, 31 May 2020 22:11:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAFqt6zaCSngh7-N_qZ6-S3Cj8CHF8DTSPv8anP_oJg5E6UWu9g@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590988224; bh=9bFIJ1fdeUjA5o+dFxctvjpXw8nTkPS99fUnc8XcE0I=;
 h=X-PGP-Universal:From:Subject:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=QbVXe76ixZyU/4kNOFUP5irHut9M8oYwtRvqVPMBs8MwCPoBca+201MH6KAunI+hC
 YI80foKFhnvqpOlbkPGohIsaFJrF/KNCZGr+3ThzCd3bCk1avxVy3WXxbF/4r2quEF
 7yrNewG5QVpWJoVuLj1oHvaRgry+KxpeM1VOIv3nmyznPJUllYlOKwL+c7N4xh6Uz+
 +qU9FTcgG6RIPcdtoZ+KUxCbcCvD5lTT2AvEWImzE7NSJc+NbL3ZKHm+rp245WmBsC
 +sdrJvoCqXCZvICidj76kgi5z1yDjAHsgJtBx183NoBxycsge6pMGpAdd0nSqbWfbK
 z4XykyLCQxZNg==
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dave Chinner <david@fromorbit.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 Linux-MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
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

On 2020-05-31 00:11, Souptick Joarder wrote:
...
>> diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core-api/pin_user_pages.rst
>> index 4675b04e8829..b9f2688a2c67 100644
>> --- a/Documentation/core-api/pin_user_pages.rst
>> +++ b/Documentation/core-api/pin_user_pages.rst
>> @@ -171,6 +171,26 @@ If only struct page data (as opposed to the actual memory contents that a page
>>   is tracking) is affected, then normal GUP calls are sufficient, and neither flag
>>   needs to be set.
>>
>> +CASE 5: Pinning in order to write to the data within the page
>> +-------------------------------------------------------------
>> +Even though neither DMA nor Direct IO is involved, just a simple case of "pin,
>> +access page's data, unpin" can cause a problem.
> 
> Will it be, *"pin, access page's data, set page dirty, unpin" * ?

Well...the problem can show up with just accessing (writing) the data.
But it is true that this statement is a little different from the
patterns below, which is confusing. I'll delete set_page_dirty() from each
of them, in order to avoid confusing things. (Although each is correct.)
And I'll also change the above to "pin, write to a page's data, upin".

set_page_dirty() interactions are really just extra credit here. :) And
fully read-only situations won't cause a problem.

> 
> Case 5 may be considered a
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
>> +

I'll send a v2 shortly.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
