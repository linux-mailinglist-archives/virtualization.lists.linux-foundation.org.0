Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 400D21402CE
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 05:12:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DDB5685A32;
	Fri, 17 Jan 2020 04:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dz1TP3ddPs3v; Fri, 17 Jan 2020 04:12:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 747F6859F1;
	Fri, 17 Jan 2020 04:12:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57831C077D;
	Fri, 17 Jan 2020 04:12:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48A4DC077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2CD8720530
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2au+Sv1hrjz
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:12:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 85C0020495
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 04:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hwLIua86PNTC41LUY82iqhVgk61ShX0Wj3SYZmEoFz0=; b=c0TN64CssfTFt/FopsUOaMpIU
 BGibgXd6TlDMasJwluNoaXq+aMXgm9gfTYQgaoFljMTukFaIF02DnZrQIAWzDqkZTlTGwUBo4oMU/
 vrhIsE9tPfq74231UwcDfdUq02y0JXq3IZImp+Abl4Jps59XFD5MXFm77PlyIPMlyQij2FZzgWR5X
 4NYuhtlEOs/oZ+rugGvI7N6Y/KPeCuKJYga2e2FrS+UnUCu4QvJF2kCEeLCYCu0H2hXi30+2OkPar
 bmcQq675YS8muXsCQnBIrZIT6412nxUkYQ3a1SWU3o7iDR3mn0CCn3toov16CiYpCX6iFTAgCNazx
 Pj5QYZHwQ==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isIzW-0006pj-To; Fri, 17 Jan 2020 04:12:14 +0000
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-6-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <55d84df0-803a-a81f-b49f-2d6fe8f78b96@infradead.org>
Date: Thu, 16 Jan 2020 20:12:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200116124231.20253-6-jasowang@redhat.com>
Content-Language: en-US
Cc: shahafs@mellanox.com, jakub.kicinski@netronome.com, lulu@redhat.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, haotian.wang@sifive.com,
 hch@infradead.org, eperezma@redhat.com, maxime.coquelin@redhat.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, lingshan.zhu@intel.com, jiri@mellanox.com,
 mhabets@solarflare.com, rob.miller@broadcom.com
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

On 1/16/20 4:42 AM, Jason Wang wrote:
> diff --git a/drivers/virtio/vdpa/Kconfig b/drivers/virtio/vdpa/Kconfig
> index 3032727b4d98..12ec25d48423 100644
> --- a/drivers/virtio/vdpa/Kconfig
> +++ b/drivers/virtio/vdpa/Kconfig
> @@ -7,3 +7,20 @@ config VDPA
>            datapath which complies with virtio specifications with
>            vendor specific control path.
>  
> +menuconfig VDPA_MENU
> +	bool "VDPA drivers"
> +	default n
> +
> +if VDPA_MENU
> +
> +config VDPA_SIM
> +	tristate "vDPA device simulator"
> +        select VDPA
> +        default n
> +        help
> +          vDPA networking device simulator which loop TX traffic back

	                                            loops

> +          to RX. This device is used for testing, prototyping and
> +          development of vDPA.
> +
> +endif # VDPA_MENU

Most lines above use spaces for indentation, while they should use
tab + 2 spaces.

-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
