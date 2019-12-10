Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3652A11909D
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 20:31:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E2F488179;
	Tue, 10 Dec 2019 19:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgRswsyKYz9A; Tue, 10 Dec 2019 19:31:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E12AE8836F;
	Tue, 10 Dec 2019 19:31:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFCA9C0881;
	Tue, 10 Dec 2019 19:31:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64AC9C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 19:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4E80987898
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 19:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLs4wie+h6VN
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 19:31:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D86F686503
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 19:31:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 988E7146E9458;
 Tue, 10 Dec 2019 11:31:37 -0800 (PST)
Date: Tue, 10 Dec 2019 11:31:37 -0800 (PST)
Message-Id: <20191210.113137.707618060141184181.davem@davemloft.net>
To: mst@redhat.com
Subject: Re: [PATCH net-next v10 1/3] netdev: pass the stuck queue to the
 timeout handler
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191210130014.47179-2-mst@redhat.com>
References: <20191210130014.47179-1-mst@redhat.com>
 <20191210130014.47179-2-mst@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 10 Dec 2019 11:31:38 -0800 (PST)
Cc: dnmendes76@gmail.com, jakub.kicinski@netronome.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 jcfaracco@gmail.com, snelson@pensando.io, mhabets@solarflare.com,
 hkallweit1@gmail.com
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


Michael, please provide a proper introductory posting for your patch series
just like everyone else does.

Not only does it help people understand at a high level what the patch
series is doing, how it is doing it, and why it is doing it that way.  It
also gives me a single email to reply to when I apply your patch series.

Therefore, please respin this properly.

Thank you.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
