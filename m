Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 441602FB9D2
	for <lists.virtualization@lfdr.de>; Tue, 19 Jan 2021 15:54:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 49F0B204E9;
	Tue, 19 Jan 2021 14:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1vL7A4iQqar; Tue, 19 Jan 2021 14:54:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9D6DE204CC;
	Tue, 19 Jan 2021 14:54:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86AE5C013A;
	Tue, 19 Jan 2021 14:54:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCB32C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 14:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A71842041F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 14:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26V0xUlgxicw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 14:54:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by silver.osuosl.org (Postfix) with ESMTPS id 78D04203E9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 14:54:02 +0000 (UTC)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 2A03C3A54;
 Tue, 19 Jan 2021 14:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2A03C3A54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1611068041; bh=cm0jvBHD4WTdeCztpNJxNQO2lLCKodXdCW5ZFrmgPJ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iX51HpPWA296zR5nlSf398dDim+1220dwMLfRTF5kRgoFjI+S6/JtTUDwQ8Tbpfty
 DIOPBgcQMqobZC4WF4QaITKGQBF41HTkPD4iDrQOUWodtVZ+xuoAyPOyhTSTOKEAgE
 C7nELS/+B7NXr/9myjRQ/fr11yufDa4Vd5riijST7Gnn5VRZoygapjWyNm711AarAA
 PgvNgz7mbpJxZ8ckyL3ntA5yxJem6FAwxOXE7atQOjvnsUBuYrH5l5hIsnumvRr8Hd
 5h/L8aSD7Shl9P+yABLO+v5R7x1sSxq+9C02Cn+OzYI0pIg1SdE/MKqc210d+RwZn4
 Jo7h4YFGM5nAQ==
Date: Tue, 19 Jan 2021 07:53:59 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [RFC v3 08/11] vduse: Introduce VDUSE - vDPA Device in Userspace
Message-ID: <20210119075359.00204ca6@lwn.net>
In-Reply-To: <20210119050756.600-2-xieyongji@bytedance.com>
References: <20210119045920.447-1-xieyongji@bytedance.com>
 <20210119050756.600-1-xieyongji@bytedance.com>
 <20210119050756.600-2-xieyongji@bytedance.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: axboe@kernel.dk, linux-aio@kvack.org, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, rdunlap@infradead.org, willy@infradead.org,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
 bob.liu@oracle.com, bcrl@kvack.org, viro@zeniv.linux.org.uk,
 stefanha@redhat.com, linux-fsdevel@vger.kernel.org
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

On Tue, 19 Jan 2021 13:07:53 +0800
Xie Yongji <xieyongji@bytedance.com> wrote:

> diff --git a/Documentation/driver-api/vduse.rst b/Documentation/driver-api/vduse.rst
> new file mode 100644
> index 000000000000..9418a7f6646b
> --- /dev/null
> +++ b/Documentation/driver-api/vduse.rst
> @@ -0,0 +1,85 @@
> +==================================
> +VDUSE - "vDPA Device in Userspace"
> +==================================

Thanks for documenting this feature!  You will, though, need to add this
new document to Documentation/driver-api/index.rst for it to be included
in the docs build.

That said, this would appear to be documentation for user space, right?
So the userspace-api manual is probably a more appropriate place for it.

Thanks,

jon
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
