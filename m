Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 730F210A65B
	for <lists.virtualization@lfdr.de>; Tue, 26 Nov 2019 23:06:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BE7CB871C0;
	Tue, 26 Nov 2019 22:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r65ZQH-7x4kE; Tue, 26 Nov 2019 22:06:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD0C886F8A;
	Tue, 26 Nov 2019 22:06:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB8B5C0881;
	Tue, 26 Nov 2019 22:06:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB2D0C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 22:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 959D386DF3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 22:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id neoiNgzp1CBV
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 22:06:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E704B86DAE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 22:06:32 +0000 (UTC)
Received: from localhost (c-73-35-209-67.hsd1.wa.comcast.net [73.35.209.67])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 1455314D44141;
 Tue, 26 Nov 2019 14:06:31 -0800 (PST)
Date: Tue, 26 Nov 2019 14:06:30 -0800 (PST)
Message-Id: <20191126.140630.1195989367614358026.davem@davemloft.net>
To: jcfaracco@gmail.com
Subject: Re: [net-next V3 0/2] drivers: net: virtio_net: implement
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191126200628.22251-1-jcfaracco@gmail.com>
References: <20191126200628.22251-1-jcfaracco@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 26 Nov 2019 14:06:31 -0800 (PST)
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 dnmendes76@gmail.com, mst@redhat.com
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


net-next is closed
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
