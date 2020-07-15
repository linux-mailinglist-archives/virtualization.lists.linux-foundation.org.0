Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A8220888
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:20:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA6388910C;
	Wed, 15 Jul 2020 09:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wj6A4q0wi22H; Wed, 15 Jul 2020 09:20:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5EB4C890FE;
	Wed, 15 Jul 2020 09:20:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 334FDC0733;
	Wed, 15 Jul 2020 09:20:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5944C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E14F1890F7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kP9PspBlnLUn
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:20:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5316A890F6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594804829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wZJXdRz3OuvEKIr6ixIjruDiELI7j1w7zQRvg35RSOI=;
 b=UQAk1brbAqEigmFQIY3mea5At/ExG1NljFKpxXTYz6w/191YH+ZH8IB4Qk60C5DZ4dCd4A
 W9uBY72R2VcJ6OuDy5ltvTcJY+LOcLVWpJQSv633fFQasvGoW91cAnnq/VwRISTSxd4jF0
 Uvo/3xGqIw/UcpiGJlQ3YFw8NC1mz5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-U6TKGjfSPMKNdyXUeZeCDA-1; Wed, 15 Jul 2020 05:20:25 -0400
X-MC-Unique: U6TKGjfSPMKNdyXUeZeCDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE0661083;
 Wed, 15 Jul 2020 09:20:22 +0000 (UTC)
Received: from gondolin (ovpn-112-242.ams2.redhat.com [10.36.112.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C879C5D9C5;
 Wed, 15 Jul 2020 09:20:16 +0000 (UTC)
Date: Wed, 15 Jul 2020 11:20:14 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v7 0/2] s390: virtio: let arch validate VIRTIO features
Message-ID: <20200715112014.7a196261.cohuck@redhat.com>
In-Reply-To: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
References: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, mst@redhat.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, thomas.lendacky@amd.com,
 hca@linux.ibm.com, david@gibson.dropbear.id.au
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

On Wed, 15 Jul 2020 10:31:07 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> Hi all,
> 
> The goal of the series is to give a chance to the architecture
> to validate VIRTIO device features.
> 
> in this respin:
> 
> 1) I kept removed the ack from Jason as I reworked the patch
>    @Jason, the nature and goal of the patch did not really changed
>            please can I get back your acked-by with these changes?
> 
> 2) Rewording for warning messages
> 
> Regards,
> Pierre
> 
> Pierre Morel (2):
>   virtio: let arch validate VIRTIO features
>   s390: virtio: PV needs VIRTIO I/O device protection
> 
>  arch/s390/mm/init.c           | 28 ++++++++++++++++++++++++++++
>  drivers/virtio/virtio.c       | 19 +++++++++++++++++++
>  include/linux/virtio_config.h |  1 +
>  3 files changed, 48 insertions(+)
> 

LGTM.

I assume that this will go either via the virtio tree or via the s390
arch tree, i.e. not through virtio-ccw, right?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
