Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D640527C14E
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 11:32:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32CAD8676F;
	Tue, 29 Sep 2020 09:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bug6yNNmJmlA; Tue, 29 Sep 2020 09:32:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2AC718676E;
	Tue, 29 Sep 2020 09:32:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D190C0895;
	Tue, 29 Sep 2020 09:32:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D23B4C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 09:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BD56285E03
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 09:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MDBtPXZsJctR
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 09:32:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 182A685DF9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 09:32:30 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601371949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LiEgRgilrtM/nzZfi6JlygGzcq6lLUMwcnD3ohkUPPc=;
 b=V0ul40K5vcOw4UxiG7CEjgVC5EMNXzfkqX2nkkkVeWg5BdnHsmzBMbDvUUlNT+cbQfIxVJ
 orRHJwgnYASv7APhPt/DKP4FC8l00M0ujGeWl//kDOd/ozYvlM3mL0vdkCNGRbzjpGYJ0Y
 Zv7VDFx9j9PdeUaErjHk+15OeqX46YQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-lHto500SOc2Jx9pUas_Pvg-1; Tue, 29 Sep 2020 05:32:27 -0400
X-MC-Unique: lHto500SOc2Jx9pUas_Pvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 019D9801AE3;
 Tue, 29 Sep 2020 09:32:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A253260BF1;
 Tue, 29 Sep 2020 09:32:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D0481750A; Tue, 29 Sep 2020 11:32:24 +0200 (CEST)
Date: Tue, 29 Sep 2020 11:32:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] drm/qxl: simplify the return expression of
 qxl_plane_prepare_fb()
Message-ID: <20200929093224.2x4x72i5pwmfe5aa@sirius.home.kraxel.org>
References: <20200921131022.91649-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921131022.91649-1-miaoqinglang@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
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

On Mon, Sep 21, 2020 at 09:10:22PM +0800, Qinglang Miao wrote:
> Simplify the return expression.

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
