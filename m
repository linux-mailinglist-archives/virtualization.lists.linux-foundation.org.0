Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 701CFF024B
	for <lists.virtualization@lfdr.de>; Tue,  5 Nov 2019 17:07:42 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7AB65111B;
	Tue,  5 Nov 2019 16:07:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E68D81074
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 16:07:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 79F4989E
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572970052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Aa7iRy6FRwmbshhu8lLwnGgjDhVFpAS/o0VXITjg6sQ=;
	b=NLsR6jd8/zLSL+COro00ZwgcVR6bPzZv4ABq9GdWfuRjVPXXAezFkWCEy1rX5KCFWBiHEt
	RJVKqVyHp1ZnAs+G58pYzKHTI39/EuRPdVHBD3nDrs0Ov1x5bDew2Kw2MIYmIyKDFUwbkO
	d8xpUbVlSE94nEWCcZQEb9mf2Ig8lqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-372-xxav4DNQOUm0VqJwTE4V1w-1; Tue, 05 Nov 2019 11:07:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1422E107ACC3;
	Tue,  5 Nov 2019 16:07:25 +0000 (UTC)
Received: from gondolin (unknown [10.36.118.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2F601FA;
	Tue,  5 Nov 2019 16:07:04 +0000 (UTC)
Date: Tue, 5 Nov 2019 17:06:59 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V8 2/6] modpost: add support for mdev class id
Message-ID: <20191105170659.766b84b0.cohuck@redhat.com>
In-Reply-To: <20191105093240.5135-3-jasowang@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
	<20191105093240.5135-3-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: xxav4DNQOUm0VqJwTE4V1w-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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

On Tue,  5 Nov 2019 17:32:36 +0800
Jason Wang <jasowang@redhat.com> wrote:

> Add support to parse mdev class id table.
> 
> Reviewed-by: Parav Pandit <parav@mellanox.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vfio/mdev/vfio_mdev.c     |  2 ++
>  scripts/mod/devicetable-offsets.c |  3 +++
>  scripts/mod/file2alias.c          | 11 +++++++++++
>  3 files changed, 16 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
