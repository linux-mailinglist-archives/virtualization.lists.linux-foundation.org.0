Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60B765D2
	for <lists.virtualization@lfdr.de>; Fri, 26 Jul 2019 14:32:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 31894CF6;
	Fri, 26 Jul 2019 12:32:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5D2C8CD5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 12:32:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8520389D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 12:32:21 +0000 (UTC)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
	helo=gondolin.hengli.com.au)
	by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hqzOJ-0003l5-Ny; Fri, 26 Jul 2019 22:32:07 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hqzOE-00028E-SW; Fri, 26 Jul 2019 22:32:02 +1000
Date: Fri, 26 Jul 2019 22:32:02 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [PATCH v2 06/35] crypto: Use kmemdup rather than duplicating its
	implementation
Message-ID: <20190726123202.GA8187@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703162708.32137-1-huangfq.daxian@gmail.com>
Organization: Core
X-Newsgroups: apana.lists.os.linux.cryptoapi, apana.lists.os.linux.kernel,
	apana.lists.os.linux.virtualization
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,FAKE_REPLY_C
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: , aymen.sghaier@nxp.com, horia.geanta@nxp.com, mst@redhat.com,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-crypto@vger.kernel.org, huangfq.daxian@gmail.com, davem@davemloft.net
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

Fuqian Huang <huangfq.daxian@gmail.com> wrote:
> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
> Changes in v2:
>  - Fix a typo in commit message (memset -> memcpy)
> 
> drivers/crypto/caam/caampkc.c              | 11 +++--------
> drivers/crypto/virtio/virtio_crypto_algs.c |  4 +---
> 2 files changed, 4 insertions(+), 11 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
