Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B69861B58E1
	for <lists.virtualization@lfdr.de>; Thu, 23 Apr 2020 12:14:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5A0A487E0B;
	Thu, 23 Apr 2020 10:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8K3nwbFkTyD; Thu, 23 Apr 2020 10:14:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5B37787DFE;
	Thu, 23 Apr 2020 10:14:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1C98C0175;
	Thu, 23 Apr 2020 10:14:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E8AEC0175
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 10:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EBD6C868A9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 10:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWZFFzgZfVXj
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 10:14:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B5C0086783
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587636867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8dGdN6Yb2PwPHUYiEBVCnUSoErNUv7Phunj1WBrbxxM=;
 b=Fq4jE7sk07N9fqNrzVbZ0JmwLz+Nli7RHR/AvC7ibr2QT3H1PRKe4++TAYm0WqO21T7ENY
 mM/Jx3FZk9BRjsfvmz8q0ddSh2zOPhHOT+zXtTalzyWE8JF/WufYisAFD3JbhvqFF3JJ3U
 P0JwkfKhXlIvwrZzS57dmDr6BTV0OuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-EdVpfdOpPo-EaMJ3-CdzTQ-1; Thu, 23 Apr 2020 06:14:23 -0400
X-MC-Unique: EdVpfdOpPo-EaMJ3-CdzTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24E7480B709;
 Thu, 23 Apr 2020 10:14:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 541F46109F;
 Thu, 23 Apr 2020 10:14:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 105171753B; Thu, 23 Apr 2020 12:14:20 +0200 (CEST)
Date: Thu, 23 Apr 2020 12:14:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dejin Zheng <zhengdejin5@gmail.com>
Subject: Re: [PATCH v1] drm/bochs: fix an issue of ioremap() leak
Message-ID: <20200423101420.ityynrorrehjvxrs@sirius.home.kraxel.org>
References: <20200421164543.16605-1-zhengdejin5@gmail.com>
 <CAHp75Ve4JwkM+=WHHF73jwNwRS39E-xPDrcn77zCUTpVkj8buA@mail.gmail.com>
 <20200422135215.GA25950@nuc8i5>
 <CAHp75Vf2j-QraBxKofgyhtAxpHXnik3DP9kefPhA_d3BuSjfvw@mail.gmail.com>
 <20200422152142.GA26943@nuc8i5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422152142.GA26943@nuc8i5>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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

> I am a newbie, andy gave me some directions to submit the patch, eg: check
> ioremap leak. At this time, I found that the bochs driver may have similar
> problems, so I submitted this patch, then, Andy said the best is to switch
> this driver to use pcim _ * () functions and drop tons of legacy code.
> I think we might be able to fix this issue first, after that, drop tons
> of legacy code by pcim_*() functions. Can you give me some suggestions?
> thank you very much!

drm has drmm_* functions for that.  Daniel Vetter <daniel@ffwll.ch> has
a patch series pending switching lots of drivers over and IIRC it fixes
this bug too.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
