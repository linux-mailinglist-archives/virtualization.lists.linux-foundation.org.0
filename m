Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB4260B52
	for <lists.virtualization@lfdr.de>; Tue,  8 Sep 2020 08:55:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 015AF2052D;
	Tue,  8 Sep 2020 06:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEFdPEClZ5yS; Tue,  8 Sep 2020 06:55:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 184682047C;
	Tue,  8 Sep 2020 06:55:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E991DC0051;
	Tue,  8 Sep 2020 06:55:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 367F0C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 06:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1EDBE20433
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 06:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62SILlXsUUPx
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 06:55:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A250203E8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599548137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJLwkK7lK8i/QhLFQOeO0BZqdoTLdZuycajPAvv67h8=;
 b=W6ntvBrX6manAD/ddopIS6GkzdiEU+uTgCNZNLpeLHkorai7pV3Lcg9HyuyEeJRq8z1owV
 NsjU0WY4HQisCkc+owfStKebgToIKW9Grvg7WvfK3YXuRCxckaA/qL4dDYGYjLp300VquJ
 /+9j7mIuUe8MD/E151DGVG6Vzd6dkx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-TwQ8Aw_uOUmrRmno2GWVaA-1; Tue, 08 Sep 2020 02:55:35 -0400
X-MC-Unique: TwQ8Aw_uOUmrRmno2GWVaA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A4F7801AC2;
 Tue,  8 Sep 2020 06:55:32 +0000 (UTC)
Received: from gondolin (ovpn-112-243.ams2.redhat.com [10.36.112.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93DDC838A6;
 Tue,  8 Sep 2020 06:55:25 +0000 (UTC)
Date: Tue, 8 Sep 2020 08:55:21 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v11 0/2] s390: virtio: let arch validate VIRTIO features
Message-ID: <20200908085521.4db22680.cohuck@redhat.com>
In-Reply-To: <20200908003951.233e47f3.pasic@linux.ibm.com>
References: <1599471547-28631-1-git-send-email-pmorel@linux.ibm.com>
 <20200908003951.233e47f3.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, mst@redhat.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, kvm@vger.kernel.org, thomas.lendacky@amd.com,
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

On Tue, 8 Sep 2020 00:39:51 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon,  7 Sep 2020 11:39:05 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
> > Hi all,
> > 
> > The goal of the series is to give a chance to the architecture
> > to validate VIRTIO device features.  
> 
> Michael, is this going in via your tree?
> 

I believe Michael's tree is the right place for this, but I can also
queue it if I get an ack on patch 1.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
