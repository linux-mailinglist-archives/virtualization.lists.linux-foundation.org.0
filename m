Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5068443307
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 08:59:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D9738CAC;
	Thu, 13 Jun 2019 06:59:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D53F6927
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 06:59:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B414987C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 06:59:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02FF22EED3A;
	Thu, 13 Jun 2019 06:59:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
	[10.36.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D16E17257;
	Thu, 13 Jun 2019 06:59:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 0322011AB8; Thu, 13 Jun 2019 08:59:26 +0200 (CEST)
Date: Thu, 13 Jun 2019 08:59:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: davidriley@chromium.org
Subject: Re: [PATCH v2 4/4] drm/virtio: Add memory barriers for capset cache.
Message-ID: <20190613065925.c6c546uyp3n3nqk5@sirius.home.kraxel.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
	<20190610211810.253227-5-davidriley@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610211810.253227-5-davidriley@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 13 Jun 2019 06:59:28 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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

On Mon, Jun 10, 2019 at 02:18:10PM -0700, davidriley@chromium.org wrote:
> From: David Riley <davidriley@chromium.org>
> 
> After data is copied to the cache entry, atomic_set is used indicate
> that the data is the entry is valid without appropriate memory barriers.
> Similarly the read side was missing the corresponding memory barriers.

All pushed to drm-misc-next

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
