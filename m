Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E51623C67CE
	for <lists.virtualization@lfdr.de>; Tue, 13 Jul 2021 03:04:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D55C5400F6;
	Tue, 13 Jul 2021 01:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZi8OiGfnxHV; Tue, 13 Jul 2021 01:04:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B672A403F4;
	Tue, 13 Jul 2021 01:04:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F894C000E;
	Tue, 13 Jul 2021 01:04:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A934C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 01:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A44D404EB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 01:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="YZaz6GHA";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="soLOB+Al"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QiY8FxmqYr4J
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 01:04:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BBF440410
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 01:04:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E108221F1;
 Tue, 13 Jul 2021 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626138288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ObWJXQqOKygCUCdanrfSFn7pdr/R2Ogad+x/MqRvTxE=;
 b=YZaz6GHAK0xIw+HmFslje9ZTVwBys9Q3ix9VBsyJwGVmOLSuTNSB69gqGEwBlb55VELOxh
 a4Ez0Q+8Mr7gbkQjEJescn77UweR98DNyIsX1DEUXSXsSZe9fBuAkp7qfPCwvB8c6PLK12
 V8GyO9of9BQFo1eJhHh7Og+fJsk7a9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626138288;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ObWJXQqOKygCUCdanrfSFn7pdr/R2Ogad+x/MqRvTxE=;
 b=soLOB+AlLhs7Pm2hSF9YFoVIaJ9QaUY8DZpJ/uABn6oCbphdUoMwhwLnzVyQJOymcm/+G7
 bFVPcfqsAUbJvGDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DC8713AD7;
 Tue, 13 Jul 2021 01:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ILWXBrDm7GCZdwAAMHmgww
 (envelope-from <lma@suse.de>); Tue, 13 Jul 2021 01:04:48 +0000
MIME-Version: 1.0
Date: Tue, 13 Jul 2021 01:04:47 +0000
From: lma <lma@suse.de>
To: willemb@google.com
Subject: [Question] virtio-net: About napi_tx
User-Agent: Roundcube Webmail
Message-ID: <c94e89f8ba97b4ac66f8fca35eb2f0ba@suse.de>
X-Sender: lma@suse.de
Cc: virtualization@lists.linux-foundation.org
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

Hi Willem and list,

The napi_tx of virtio_net is enabled by default by commit 31c03aef.

and the commit message mentioned:
     In the unlikely case of regression, we have landed a credible 
runtime
     solution. Ethtool can configure it with -C tx-frames [0|1] as of
     commit 0c465be183c7 ("virtio_net: ethtool tx napi configuration").

I'd like to know more about "the unlikely case of regression".
Is it workloads related or bare metal hardware related?

Do you mind to explain some details?

Thanks,
Lin
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
