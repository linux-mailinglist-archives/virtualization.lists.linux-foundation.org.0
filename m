Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0153F2C4F
	for <lists.virtualization@lfdr.de>; Fri, 20 Aug 2021 14:42:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E8C58101D;
	Fri, 20 Aug 2021 12:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQY7hKWekh3n; Fri, 20 Aug 2021 12:42:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6D6FF8100D;
	Fri, 20 Aug 2021 12:42:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E93BAC0022;
	Fri, 20 Aug 2021 12:42:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00092C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Aug 2021 12:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9A40605D9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Aug 2021 12:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ellerman.id.au
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xU-YHr8SpB_p
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Aug 2021 12:42:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ECBA613E3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Aug 2021 12:42:34 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Grgzv3Qhxz9sWq;
 Fri, 20 Aug 2021 22:34:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629462845;
 bh=RvSoZj9qGbuGPBLusBDgZESowYHwhMMiBJyC8aIMk60=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mtQUVDWVN21fl7CB8Gv+bXzF4FyNyW44mL2BYz7qsbt/eYeNT69e584cR6zMVbxqO
 ynl5XZWnLQ45izhHFGBbzG1riwSDXF5HxR7P6MYnAHHiOX2/bE53XIUnaRqRJMDFAm
 P8zAFSBs7KWapWa9nTnuKg/KNnO3bZ2mOUawCw+CDy+9UnJXlCv1wJXqDWlnNolPaB
 rXl1Ck3kKrE+EXgUNuoH0szMYFn4EqkJTs0hQNEXiHpEp16L82OBAnWkCq19clUSEG
 6/9GTOU9oqC5kGb9R5dOO/Mh4wDbKHUsiboA1eolxLil/INGfzViLXj4lvJnbxaRGw
 0qe92o3jgy8cw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Xianting Tian
 <xianting.tian@linux.alibaba.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, amit@kernel.org, arnd@arndb.de, osandov@fb.com
Subject: Re: [PATCH v8 2/3] tty: hvc: pass DMA capable memory to put_chars()
In-Reply-To: <87pmu8ehkk.fsf@linkitivity.dja.id.au>
References: <20210818082122.166881-1-xianting.tian@linux.alibaba.com>
 <20210818082122.166881-3-xianting.tian@linux.alibaba.com>
 <87pmu8ehkk.fsf@linkitivity.dja.id.au>
Date: Fri, 20 Aug 2021 22:34:02 +1000
Message-ID: <87pmu8cn2d.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Cc: Xianting Tian <xianting.tian@linux.alibaba.com>,
 shile.zhang@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Daniel Axtens <dja@axtens.net> writes:
> Xianting Tian <xianting.tian@linux.alibaba.com> writes:
>
>> As well known, hvc backend driver(eg, virtio-console) can register its
>> operations to hvc framework. The operations can contain put_chars(),
>> get_chars() and so on.
>>
>> Some hvc backend may do dma in its operations. eg, put_chars() of
>> virtio-console. But in the code of hvc framework, it may pass DMA
>> incapable memory to put_chars() under a specific configuration, which
>> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
>
> We could also run into issues on powerpc where Andrew is working on
> adding vmap-stack but the opal hvc driver assumes that it is passed a
> buffer which is not in vmalloc space but in the linear mapping.

The right fix for that is our code that calls opal has to be careful
that it's not passing vmalloc addresses.

We have many cases where we pass stack variables to opal, they'll all
have to be fixed to pass the underlying phyiscal/linear map address. The
opal hvc code will just be one more case of that.

cheers
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
