Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5E0A2F6B
	for <lists.virtualization@lfdr.de>; Fri, 30 Aug 2019 08:10:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EE8325BDF;
	Fri, 30 Aug 2019 06:10:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 920AB5BD2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 06:08:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 584303D0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 06:08:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB4E030832C6;
	Fri, 30 Aug 2019 06:08:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB755C1D6;
	Fri, 30 Aug 2019 06:08:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A32B317536; Fri, 30 Aug 2019 08:08:57 +0200 (CEST)
Date: Fri, 30 Aug 2019 08:08:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Riley <davidriley@chromium.org>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
Message-ID: <20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829212417.257397-1-davidriley@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 30 Aug 2019 06:08:58 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
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

  Hi,

>  {
>  	if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
>  		kfree(vbuf->resp_buf);
> -	kfree(vbuf->data_buf);
> +	kvfree(vbuf->data_buf);

if (is_vmalloc_addr(vbuf->data_buf)) ...

needed here I gues?

> +/* Create sg_table from a vmalloc'd buffer. */
> +static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size)

Hmm, isn't there an existing function for that?
I'd be surprised if virtio-gpu is the first driver needing this ...

And it case there really isn't one this should probably added to the
vmalloc or scatterlist code, not the virtio-gpu driver.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
