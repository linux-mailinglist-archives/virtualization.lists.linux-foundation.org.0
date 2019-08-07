Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B060584CC6
	for <lists.virtualization@lfdr.de>; Wed,  7 Aug 2019 15:21:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CDC97CB6;
	Wed,  7 Aug 2019 13:21:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C9274C5C
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 13:21:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8D084823
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 13:21:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1169E69080;
	Wed,  7 Aug 2019 13:21:02 +0000 (UTC)
Received: from localhost (ovpn-117-144.ams2.redhat.com [10.36.117.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0627F60BE1;
	Wed,  7 Aug 2019 13:20:56 +0000 (UTC)
Date: Wed, 7 Aug 2019 14:20:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 0/4] virtio: Add definitions for shared memory regions
Message-ID: <20190807132055.GB32432@stefanha-x1.localdomain>
References: <20190725175044.29303-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725175044.29303-1-dgilbert@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 07 Aug 2019 13:21:02 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mst@redhat.com, sebastien.boeuf@intel.com, vgoyal@redhat.com,
	virtualization@lists.linux-foundation.org
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

On Thu, Jul 25, 2019 at 06:50:40PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add the virtio shared memory region definitions that
> have just got merged into the spec.
> 
> Dr. David Alan Gilbert (4):
>   virtio_pci: Define id field
>   virtio_pci: Define virtio_pci_cap64
>   virtio_pci: Defined shared memory capability
>   virito_mmio: Define shared memory region registers
> 
>  include/uapi/linux/virtio_mmio.h | 11 +++++++++++
>  include/uapi/linux/virtio_pci.h  | 11 ++++++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> -- 
> 2.21.0
> 

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
