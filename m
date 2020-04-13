Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CCF1A6EA2
	for <lists.virtualization@lfdr.de>; Mon, 13 Apr 2020 23:52:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BE7C08647A;
	Mon, 13 Apr 2020 21:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VhkuykAPjK8; Mon, 13 Apr 2020 21:52:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 41161864B2;
	Mon, 13 Apr 2020 21:52:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BEACC0172;
	Mon, 13 Apr 2020 21:52:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67CA7C0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 21:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5E49B87410
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 21:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uD6xNHojLaXS
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 21:52:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7392187B4F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 21:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586814764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxqewLP4iDn0WQn56N4JoZnVO/VnkSCHun6WFS8TA58=;
 b=ZtXlUR+jTPnPN3iCA/WKmMCiPRo/hAbmohSMyJGHGYT5o6A8cEKHi7627TDTDbNJ1TeeIo
 p8bBsVkbQlAOOZyLatf6AQfHgPPE8r3rc+shdpzSFQy3NMuUjhIpz78Cva0U8Z66l77Jjy
 UVK9pTbtiTQkMRsi9aA4mLn8axE6Yp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-R_QYnAHVPD67nMQL-Amo0w-1; Mon, 13 Apr 2020 17:52:38 -0400
X-MC-Unique: R_QYnAHVPD67nMQL-Amo0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1B928018AA;
 Mon, 13 Apr 2020 21:52:32 +0000 (UTC)
Received: from llong.remote.csb (ovpn-115-28.rdu2.redhat.com [10.10.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB5E15C1B2;
 Mon, 13 Apr 2020 21:52:24 +0000 (UTC)
Subject: Re: [PATCH 2/2] crypto: Remove unnecessary memzero_explicit()
To: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413211550.8307-3-longman@redhat.com>
 <efd6ceb1f182aa7364e9706422768a1c1335aee4.camel@perches.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <7e13a94b-2e92-850f-33f7-0f42cfcd9009@redhat.com>
Date: Mon, 13 Apr 2020 17:52:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <efd6ceb1f182aa7364e9706422768a1c1335aee4.camel@perches.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: samba-technical@lists.samba.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-crypto@vger.kernel.org,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
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

On 4/13/20 5:31 PM, Joe Perches wrote:
> On Mon, 2020-04-13 at 17:15 -0400, Waiman Long wrote:
>> Since kfree_sensitive() will do an implicit memzero_explicit(), there
>> is no need to call memzero_explicit() before it. Eliminate those
>> memzero_explicit() and simplify the call sites.
> 2 bits of trivia:
>
>> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> []
>> @@ -391,10 +388,7 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>>  		dev_dbg(ce->dev, "ERROR: Invalid keylen %u\n", keylen);
>>  		return -EINVAL;
>>  	}
>> -	if (op->key) {
>> -		memzero_explicit(op->key, op->keylen);
>> -		kfree(op->key);
>> -	}
>> +	kfree_sensitive(op->key);
>>  	op->keylen = keylen;
>>  	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>>  	if (!op->key)
> It might be a defect to set op->keylen before the kmemdup succeeds.
It could be. I can move it down after the op->key check.
>> @@ -416,10 +410,7 @@ int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
>>  	if (err)
>>  		return err;
>>  
>> -	if (op->key) {
>> -		memzero_explicit(op->key, op->keylen);
>> -		kfree(op->key);
>> -	}
>> +	free_sensitive(op->key, op->keylen);
> Why not kfree_sensitive(op->key) ?

Oh, it is a bug. I will send out v2 to fix that.

Thanks for spotting it.

Cheers,
Longman


>
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
