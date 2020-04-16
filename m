Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDDC1AC101
	for <lists.virtualization@lfdr.de>; Thu, 16 Apr 2020 14:21:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E958B87B3D;
	Thu, 16 Apr 2020 12:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id paCKBijxX8ht; Thu, 16 Apr 2020 12:21:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B34E187917;
	Thu, 16 Apr 2020 12:21:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91E44C0172;
	Thu, 16 Apr 2020 12:21:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 091C5C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 12:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E4C4386018
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 12:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNiT8VScc6Iz
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 12:20:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B867F8464A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 12:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587039656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N//aUi9ilfSYZbtt9uubNhdLlMHa9VPzC/9aWc7u2N4=;
 b=SYbmxk0BO1FjmSLlFeIhhb3j24hKT5JGSTwtBWBHBCezUWVPvl4FywRRm8dKsvI98dssNK
 4NZiW0XE4wCcBmAGrVFtXerAs6xNttlZ+uNlKRK6BSJy/4EpedxoOsf9bxTtPQGkb4YKJP
 JfU/9dvBz7DHa1q7Go+979NK9fd4N0U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-4C55DljDMLe4EztS-7odaQ-1; Thu, 16 Apr 2020 08:20:52 -0400
X-MC-Unique: 4C55DljDMLe4EztS-7odaQ-1
Received: by mail-wr1-f72.google.com with SMTP id y1so1624387wrp.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 05:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N//aUi9ilfSYZbtt9uubNhdLlMHa9VPzC/9aWc7u2N4=;
 b=chhpnNMb3/vnsVuAmOHL34fTjiUAqeZHwvFEqoHRzSCDtFkICacJKjc0oe5Y76fSn/
 brMMdw3NTFLj33bc/kaWiialh/5/uT6Ld25OmRPKw1ItpCTf2dmwcboVLvoaHwD0bqk4
 66yQGkBSLRVpNdZPxa3fg5tt1v6wDdipTGzJ+HG+9woqHfSMlC03RT67XJvMG8YHtoZT
 dd8z2npDv7XO/f8q9HGwecSqIpQc8KAayhfEXCugb7/wm/Cj1RhI1xCY1JO40yFWjU16
 XUmhQq7xisSEzuGxfAVKZSekyatebWcOi8wRzffhGm+AXpe0+RF3cJaLjSOrbiKGqR1S
 1lcA==
X-Gm-Message-State: AGi0PuZEwMb++J7yO0vJm2VwGJrEAx1NYuieEcG+CJpU8qZde1J89lUg
 zR7Mjs6Sp9CasVnbrzhibaOAgINCGFwSppYNaReNHHx1D52fG7mKYb+e5rqWbOx1tZwBVyWy10c
 pn/Dmf1g+nsQnAo0iqyX2NuVygkkitDctMrG8G26njw==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr4634842wme.20.1587039648643; 
 Thu, 16 Apr 2020 05:20:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypL7Zr1AmadDiZcqsAC7y2lchYjfJabub1W1Nve6Z9EGEGzkMDXcyVU803uWBITr/U3dkRDooA==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr4634814wme.20.1587039648429; 
 Thu, 16 Apr 2020 05:20:48 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id a67sm3645719wmc.30.2020.04.16.05.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 05:20:47 -0700 (PDT)
Date: Thu, 16 Apr 2020 08:20:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] vhost: cleanups and fixes
Message-ID: <20200416081330-mutt-send-email-mst@kernel.org>
References: <20200414123606-mutt-send-email-mst@kernel.org>
 <CAHk-=wgVQcD=JJVmowEorHHQSVmSw+vG+Ddc4FATZoTp9mfUmw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgVQcD=JJVmowEorHHQSVmSw+vG+Ddc4FATZoTp9mfUmw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: hulkci@huawei.com, matej.genci@nutanix.com, KVM list <kvm@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Netdev <netdev@vger.kernel.org>, yanaijie@huawei.com,
 YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, ashutosh.dixit@intel.com,
 eperezma@redhat.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 eli@mellanox.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Markus Elfring <elfring@users.sourceforge.net>
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

On Wed, Apr 15, 2020 at 05:46:33PM -0700, Linus Torvalds wrote:
> On Tue, Apr 14, 2020 at 9:36 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > virtio: fixes, cleanups
> 
> Looking at this, about 75% of it looks like it should have come in
> during the merge window, not now.
> 
>               Linus

Well it's all just fallout from

	commit 61b89f23f854f458b8e23719978df58260f051ed
	Author: Michael S. Tsirkin <mst@redhat.com>
	Date:   Mon Apr 6 08:42:55 2020 -0400

	    vhost: force spec specified alignment on types

which I didn't know we need until things landed upstream and
people started testing with weird configs.

That forced changes to a header file and the rest followed.

We could just ignore -mabi=apcs-gnu build being broken for this release -
is that preferable? Pls let me know.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
