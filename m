Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B4D24D03E
	for <lists.virtualization@lfdr.de>; Fri, 21 Aug 2020 10:02:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F05188633;
	Fri, 21 Aug 2020 08:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U+Wda3k05L0j; Fri, 21 Aug 2020 08:02:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB9C088637;
	Fri, 21 Aug 2020 08:02:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A0BBC0051;
	Fri, 21 Aug 2020 08:02:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51CE9C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 08:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 17F5B203C8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 08:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ktm0KJGJBQe9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 08:02:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by silver.osuosl.org (Postfix) with ESMTPS id 6A3592313B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 08:01:33 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1k91zF-00049M-O4; Fri, 21 Aug 2020 18:01:22 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 21 Aug 2020 18:01:21 +1000
Date: Fri, 21 Aug 2020 18:01:21 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] crypto: virtio - don't use 'default m'
Message-ID: <20200821080121.GA25399@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812192053.1769235-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,
 apana.lists.os.linux.virtualization
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mst@redhat.com, rammuthiah@google.com,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org
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

Eric Biggers <ebiggers@kernel.org> wrote:
> From: Ram Muthiah <rammuthiah@google.com>
> 
> Drivers shouldn't be enabled by default unless there is a very good
> reason to do so.  There doesn't seem to be any such reason for the
> virtio crypto driver, so change it to the default of 'n'.
> 
> Signed-off-by: Ram Muthiah <rammuthiah@google.com>
> [EB: adjusted commit message]
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> drivers/crypto/virtio/Kconfig | 1 -
> 1 file changed, 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
