Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB5198229
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 19:22:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5B22E22E3F;
	Mon, 30 Mar 2020 17:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wOhOmn1Xhd5T; Mon, 30 Mar 2020 17:22:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 108CA20516;
	Mon, 30 Mar 2020 17:22:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE52FC07FF;
	Mon, 30 Mar 2020 17:22:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38FC4C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 17:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 239BA868B4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 17:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82RvXNJP-NFr
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 17:22:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8E3C1864A6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=RTo/l3mApqYi+FAC2NhO4jmI7vS3v+umdzjqut0gXrs=; b=epXZGh7AJkvwaCOfIcKqPes0O/
 TZITBPLJ88zQPtBJYZxf/f+N9pIbvNHDFyWCZ0wjXtVdOjKd25Vc73LrepJ+kipztOfwjgUSVaryX
 UG1rbVv8MnGL4HsfqIyw4Vh4iTHJCIU+4PhLMEhCEGoEC7az/TGfhzvfj0bNUpgc97iNQ8YDWnq5b
 PRY3uA5tZ5rVg9ltHXbwyZolCXHdXcxmEXPANZeWq5aCsZrN1iq/sa05mLZwQMRu/PCBFRcpwsB3u
 9nxP4tCR5U9Vp2iowEfYq/89hQp9GeyDH74PDtlQbZc8ZW54JObpESALTg8+N9k+oNVirfOtM2WJ0
 Yp9p0LdA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIy7E-0005n4-7Q; Mon, 30 Mar 2020 17:22:24 +0000
Subject: Re: linux-next: Tree for Mar 30 (vhost)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200330204307.669bbb4d@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
Date: Mon, 30 Mar 2020 10:22:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330204307.669bbb4d@canb.auug.org.au>
Content-Language: en-US
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KVM <kvm@vger.kernel.org>, virtualization@lists.linux-foundation.org
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

On 3/30/20 2:43 AM, Stephen Rothwell wrote:
> Hi all,
> 
> The merge window has opened, so please do not add any material for the
> next release into your linux-next included trees/branches until after
> the merge window closes.
> 
> Changes since 20200327:
> 
> The vhost tree gained a conflict against the kvm-arm tree.
> 

(note: today's linux-next is on 5.6-rc7.)

on x86_64:

# CONFIG_EVENTFD is not set

../drivers/vhost/vhost.c: In function 'vhost_vring_ioctl':
../drivers/vhost/vhost.c:1577:33: error: implicit declaration of function 'eventfd_fget'; did you mean 'eventfd_signal'? [-Werror=implicit-function-declaration]
   eventfp = f.fd == -1 ? NULL : eventfd_fget(f.fd);
                                 ^~~~~~~~~~~~
                                 eventfd_signal
../drivers/vhost/vhost.c:1577:31: warning: pointer/integer type mismatch in conditional expression
   eventfp = f.fd == -1 ? NULL : eventfd_fget(f.fd);
                               ^

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
