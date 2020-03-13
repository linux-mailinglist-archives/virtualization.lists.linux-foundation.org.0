Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C5184975
	for <lists.virtualization@lfdr.de>; Fri, 13 Mar 2020 15:35:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BEB6288BE0;
	Fri, 13 Mar 2020 14:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnWzIKjiRlWt; Fri, 13 Mar 2020 14:35:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0892088BCB;
	Fri, 13 Mar 2020 14:35:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6D71C0177;
	Fri, 13 Mar 2020 14:35:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A1F8C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 14:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 35512203F8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 14:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRQcJcas0lh1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 14:35:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 55C42203AD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584110134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WezdpOlVzbaVEs6vfCIvevGk8ide+y5ytNMFt7/McDI=;
 b=OQiDJfsMfXrisXCbzA7Q1mFgNbAFWXWvNRTj8BnzXR/oL7J9TuLlFT9B6oN0PsnaoJNLG5
 uDe+wMKHRINU+S4BTeRHTlT10gzwhnbRlvJV+3xyPxiuZ3ZRp8P65HsF7mvL6MjIimRhmM
 LSqyT7AbFULDGjHHllaABjgy3AJqKPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-2q7-IqrANO65NjR6AP5ocw-1; Fri, 13 Mar 2020 10:35:33 -0400
X-MC-Unique: 2q7-IqrANO65NjR6AP5ocw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF02E1005509;
 Fri, 13 Mar 2020 14:35:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 225AF907F7;
 Fri, 13 Mar 2020 14:35:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1C1A29DB3; Fri, 13 Mar 2020 15:35:30 +0100 (CET)
Date: Fri, 13 Mar 2020 15:35:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3] drm/bochs: downgrade pci_request_region failure from
 error to warning
Message-ID: <20200313143530.6aoagldak3kpe3xv@sirius.home.kraxel.org>
References: <20200313084152.2734-1-kraxel@redhat.com>
 <20200313090338.GA31815@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313090338.GA31815@ravnborg.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, marmarek@invisiblethingslab.com,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
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

  Hi,

> > +	if (pci_request_region(pdev, 0, "bochs-drm") != 0)
> > +		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
> So you could use drm_WARN() which is what is preferred these days.

Nope, this isn't yet in -fixes.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
