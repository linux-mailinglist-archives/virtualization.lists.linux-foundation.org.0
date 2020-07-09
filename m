Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F3411219A05
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 09:33:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6ADEB203DA;
	Thu,  9 Jul 2020 07:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJPEDwUK3TO6; Thu,  9 Jul 2020 07:33:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 34B1E20003;
	Thu,  9 Jul 2020 07:33:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E309CC016F;
	Thu,  9 Jul 2020 07:33:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 671B7C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 07:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 760AB852CF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 07:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_GpAUNKzwLc
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 07:32:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4AE0E851CC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 07:32:55 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id n2so1025201edr.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jul 2020 00:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j7DqbPSyBqq2qwNcdYTCxivolsap4LLnpECg1M+YJYk=;
 b=QDbnDBZ69vZU31U3QJjVIJId5oppdSakVTaxS0UP31hBAdHpldsoia5vpYPvPG/1pU
 usdfPEJ6nijNkCcfc0+shvTmVwAUIrFUC8LrkiOVWspagEbvZ+wsDzfDYd6VFGbxWmDp
 F4jT2kx6PfK8zHtBoz0z3Nlz9vhzCej7P2FGYAcUWRHh/xrkapd3HGvA33QTlxGVjxbY
 qzkk36nQxEHM+5PMpaGuJfVq53eN9kJOESUkwbkxbOq0u6dGJlqGI6+f83AULyyhMfYA
 ENOFTGAWtm/GeTylFoqY1uSMte/oOu2WGE1JPF+Es14svs8XuFeO7RD+DajSSNiEO1fl
 dbNQ==
X-Gm-Message-State: AOAM530OuzlDXeUreWtAbRbXLAmxQCzOBbE/U30KvhNjjYSjAM/KFKh9
 nxMNSJ7UPNmfAneOuNlPQ+E=
X-Google-Smtp-Source: ABdhPJwrkOg1VmskPen0ndAgGUffYWkrKR783vprCdOePKnp0T8h/KXoPOC3hmTqCSglRRVLLvqDkw==
X-Received: by 2002:a50:d8c2:: with SMTP id y2mr62468108edj.114.1594279973653; 
 Thu, 09 Jul 2020 00:32:53 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
 by smtp.googlemail.com with ESMTPSA id sa10sm1258696ejb.79.2020.07.09.00.32.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Jul 2020 00:32:52 -0700 (PDT)
Date: Thu, 9 Jul 2020 09:32:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-ntb@googlegroups.com,
 virtualization@lists.linux-foundation.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 1/4] iomap: Constify ioreadX() iomem argument (as in
 generic implementation)
Message-ID: <20200709073249.GA6335@kozik-lap>
References: <20200709072837.5869-1-krzk@kernel.org>
 <20200709072837.5869-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709072837.5869-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Jul 09, 2020 at 09:28:34AM +0200, Krzysztof Kozlowski wrote:
> The ioreadX() and ioreadX_rep() helpers have inconsistent interface.  On
> some architectures void *__iomem address argument is a pointer to const,
> on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I forgot to put here one more Ack, for PowerPC:
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

https://lore.kernel.org/lkml/87ftedj0zz.fsf@mpe.ellerman.id.au/

Best regards,
Krzysztof

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
