Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065B4DCF8F
	for <lists.virtualization@lfdr.de>; Thu, 17 Mar 2022 21:42:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADA3E418FD;
	Thu, 17 Mar 2022 20:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKOBgPbHygPk; Thu, 17 Mar 2022 20:42:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6347A41901;
	Thu, 17 Mar 2022 20:42:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF58CC000B;
	Thu, 17 Mar 2022 20:42:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 941D4C000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 20:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8238560B61
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 20:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-rpAmTNonXn
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 20:42:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6978060AD0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ROV+N7/7nL9ebCMUk84kLWbG+brDW++VtuozCZVdtkw=; b=Jqch/btFqW+CCJM0MuFijvZBnR
 bKqVKg8MJPsG7xgEbyq8GpqXB7A8dE9YvSejZgGKMwlrFERInyVW/NwSKf4kQ/UA6psueuXc8llbi
 tXp3gLO4A62BpBOiR5EK3lKKSfjt468nR9YWHbd0+I9WP14Gea0xgxgt+KOMxkIpTtW+MOsIHvwgj
 hM+KtvJ/9csmz19wnZcmlJxpYZuCql/Ep3kcCjBTlQo66UU7MNW7TyDClTi6xfWHMMGkptDRxOs/s
 kZkV9zPnBYwNqiK7nc3Q5CI7k99U6h5ic0GJ7k9j/2cf6pf3fSTuSgb5ZJ6Kw6nbakmqXx6kZ8nsy
 H+5jNfRw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUwvV-007InG-0P; Thu, 17 Mar 2022 20:40:53 +0000
Message-ID: <da13fa80-83e7-f7cc-abf8-97b9e23a6737@infradead.org>
Date: Thu, 17 Mar 2022 13:40:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/9] virtio_console: eliminate anonymous module_init &
 module_exit
Content-Language: en-US
To: Amit Shah <amit@infradead.org>, linux-kernel@vger.kernel.org
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-3-rdunlap@infradead.org>
 <f7b858bb438d1979c1f092e105e0db4c7af47758.camel@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f7b858bb438d1979c1f092e105e0db4c7af47758.camel@infradead.org>
Cc: x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Krzysztof Opasiak <k.opasiak@samsung.com>, Eli Cohen <eli@mellanox.com>,
 netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Joachim Fritschi <jfritschi@freenet.de>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, Amit Shah <amit@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, Karol Herbst <karolherbst@gmail.com>,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
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



On 3/17/22 08:47, Amit Shah wrote:
> On Wed, 2022-03-16 at 12:20 -0700, Randy Dunlap wrote:
>> Eliminate anonymous module_init() and module_exit(), which can lead to
>> confusion or ambiguity when reading System.map, crashes/oops/bugs,
>> or an initcall_debug log.
>>
>> Give each of these init and exit functions unique driver-specific
>> names to eliminate the anonymous names.
>>
>> Example 1: (System.map)
>>  ffffffff832fc78c t init
>>  ffffffff832fc79e t init
>>  ffffffff832fc8f8 t init
>>
>> Example 2: (initcall_debug log)
>>  calling  init+0x0/0x12 @ 1
>>  initcall init+0x0/0x12 returned 0 after 15 usecs
>>  calling  init+0x0/0x60 @ 1
>>  initcall init+0x0/0x60 returned 0 after 2 usecs
>>  calling  init+0x0/0x9a @ 1
>>  initcall init+0x0/0x9a returned 0 after 74 usecs
>>
>> Fixes: 31610434bc35 ("Virtio console driver")
>> Fixes: 7177876fea83 ("virtio: console: Add ability to remove module")
>> Signed-off-by: Randy Dunlap <
>> rdunlap@infradead.org
>>>
>> Cc: Amit Shah <
>> amit@kernel.org
>>>
>> Cc: 
>> virtualization@lists.linux-foundation.org
>>
>> Cc: Arnd Bergmann <
>> arnd@arndb.de
>>>
>> Cc: Greg Kroah-Hartman <
>> gregkh@linuxfoundation.org
>>>
>> ---
>>  drivers/char/virtio_console.c |    8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Amit Shah <amit@kernel.org>
> 
> I don't think the Fixes-by really applies here, though - we don't
> really want to push this into stable, nor do we want any automated
> tools to pick this up because of that tag..

Yeah, I'm fine with that.

thanks.

-- 
~Randy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
