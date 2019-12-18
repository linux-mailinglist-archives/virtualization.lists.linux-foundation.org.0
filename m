Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A25EF124AC3
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 16:10:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 41A2C884A9;
	Wed, 18 Dec 2019 15:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hojT+rGOQuLL; Wed, 18 Dec 2019 15:10:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D1DB884A0;
	Wed, 18 Dec 2019 15:10:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 855ACC077D;
	Wed, 18 Dec 2019 15:10:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E46BC077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 15:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E7BBE884A0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 15:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEgdSISNaCwP
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 15:10:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A98C2883D7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576681818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QM58zRG2E33uopTi5C1OLZUP84XlNWgGlqpWQbuCIPw=;
 b=h6j1TOjFAv0MKuY3o/ltRzrGXHbVN5Qo+tzKNUBJtuR0lqJaJJQ6rc5HsMDVUIf+DlWG3G
 3G80Xu9BHBbCbxEwMPy161VALq/Hos0CNc+BT6rwZU0e4OuCl8d9IDJlMYNdR1AEWN9fDz
 /FLiJiGRn8NsZHlfHsxQwxeWptR8UDk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-PAg1fpSLNgexoX44rtw_gw-1; Wed, 18 Dec 2019 10:10:16 -0500
Received: by mail-qt1-f197.google.com with SMTP id t4so1572809qtd.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 07:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QM58zRG2E33uopTi5C1OLZUP84XlNWgGlqpWQbuCIPw=;
 b=DujodtMMcl3A9QgX63XGs38SlHy3XdbZDyYVCELbAdFNNPOn4LFMiOTp6quv5jxD2H
 Ha5158ftURy6STjMByc+hcAuu9ELk0ZGOY5Efwwa+aBUIWbrkhxhd2Q9zQulwqzgI7S8
 4xCgWs+KmlMmBTIRNZdwmBGxTKaESl3PKHF7R06WSi95LgTTBAq5yKMhgv2eY7pFIu9b
 Dm3Gv7gWUukRaVFHxdhytGt7mudwMK5oHrU71Vi1tRM+hY0BGx4MdFoYcpFOvtvrdQVf
 M1zy+6u0sqbdQ2Jam/7VZ0E8kLXgBpC/554uliwXXKKzg+fkCwtd9LVy+LNQa9VKXSPb
 PFJg==
X-Gm-Message-State: APjAAAW6mVMn84nscCykdLyd5++WCx7KBQaJLZOcOs8arBytEKkwRC2k
 ccDiXaPyZCeMpeISp3qvu6pg6uqzCtsqTcbd6JpCmq/4IxtJp+bNy/+/KcjWqwV2+1HurtvWUL6
 boVX1hy9DZOgafgTqtTWgrxjsNMqewra02VAzJ7kvdA==
X-Received: by 2002:a0c:e1ce:: with SMTP id v14mr2673047qvl.39.1576681816438; 
 Wed, 18 Dec 2019 07:10:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhQfsc+4bORIeWfJPGw6vR+W11ECcHruYmI+Dy/4t2QYKRuVwYMstb8WaGcqyUqp1oBsusFQ==
X-Received: by 2002:a0c:e1ce:: with SMTP id v14mr2673022qvl.39.1576681816185; 
 Wed, 18 Dec 2019 07:10:16 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id i19sm716606qki.124.2019.12.18.07.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:10:15 -0800 (PST)
Date: Wed, 18 Dec 2019 10:10:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20191218100926-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
X-MC-Unique: PAg1fpSLNgexoX44rtw_gw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Wed, Dec 18, 2019 at 03:43:43PM +0100, Christian Borntraeger wrote:
> Michael,
> 
> with 
> commit db7286b100b503ef80612884453bed53d74c9a16 (refs/bisect/skip-db7286b100b503ef80612884453bed53d74c9a16)
>     vhost: use batched version by default
> plus
> commit 6bd262d5eafcdf8cdfae491e2e748e4e434dcda6 (HEAD, refs/bisect/bad)
>     Revert "vhost/net: add an option to test new code"
> to make things compile (your next tree is not easily bisectable, can you fix that as well?).

I'll try.

> 
> I get random crashes in my s390 KVM guests after reboot.
> Reverting both patches together with commit decd9b8 "vhost: use vhost_desc instead of vhost_log" to
> make it compile again) on top of linux-next-1218 makes the problem go away.
> 
> Looks like the batched version is not yet ready for prime time. Can you drop these patches until
> we have fixed the issues?
> 
> Christian
> 

Will do, thanks for letting me know.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
