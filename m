Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6434C174D02
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 12:32:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE3C284836;
	Sun,  1 Mar 2020 11:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPumH8iKiS_V; Sun,  1 Mar 2020 11:32:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E86C84808;
	Sun,  1 Mar 2020 11:32:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93712C013E;
	Sun,  1 Mar 2020 11:32:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 997BDC013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 86CB884EAD
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amH8+5pX-WiY
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:32:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 01ECC84F75
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583062352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zR/LdJJnupWbWl+mH1H8twhZv1I1NZI2NpfYhhtSOII=;
 b=E1S6DOy+f7HzXwAdbHBdtNqwlTX6leQN6iz8116cMWhbLhVIwwDS+Pnm44/H8GN6PndeIS
 4LeefRGgvI8YG1mb61lp7LLsW0wfuUonmhYtvqmqg8F4RQLR7xy7P3mfUb0yh1RUmndp4G
 QJZr3EXQlWDE5ZnbMPKaanrni7OycDQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-okEtfInWNJKqSHAfIA9ZEw-1; Sun, 01 Mar 2020 06:32:31 -0500
X-MC-Unique: okEtfInWNJKqSHAfIA9ZEw-1
Received: by mail-qt1-f200.google.com with SMTP id e8so6941794qtg.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 03:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zR/LdJJnupWbWl+mH1H8twhZv1I1NZI2NpfYhhtSOII=;
 b=DM1eoUsF8kSUAx26yUyXSckjypKWA46leh+GfXMdYISgBBtGbyM0OCyPVm5JuHAqpR
 4KQmsvsx8NHmct2rhApOp4VgRxeq9YiOJMmGXuy+b6duIf1b59/061Ra4F/z8p+PRSnQ
 +yLUhwV7nBKQvTHdyt4Nd7CMxsnV3TI05r58pl92RwzTe/sB1QTGGrbIoHAsS62kcYS+
 qJN5VQAjp6fXNVqCwVvr91xPFzJ7UBfi+T4vOfzfQn4fk2lJGyP1dlw3VgWNZCfZa2bO
 1gLKq5HmfhT65qljmjwlPTmhrf++edaYeli+k5IJQ163WAjt/jQZ4/B+489EuSFbSTXt
 oN1A==
X-Gm-Message-State: APjAAAW6vo9FMoj+H4KonYEfEfMkebn5Ks1dllAbolnJtshUCmhPrrq4
 ioPs/FGZtzcDREPPKV71ewqT82is+H2znehawuiq/3T7ceENsGeRO/kXBsSlIgnXWVinyNTctoZ
 KQcz2OkrFyHY7GELvHc3QSv7ZNZSQEhGqGaTFV1dCwA==
X-Received: by 2002:a37:a9c3:: with SMTP id
 s186mr11388266qke.118.1583062351000; 
 Sun, 01 Mar 2020 03:32:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqwN2KD8vMG5Oz6ApHiiKMTGkLA+MN8pVictr/ay8FZqU16cVcRdz1BqNJooFZNymjo2uQiuXw==
X-Received: by 2002:a37:a9c3:: with SMTP id
 s186mr11388257qke.118.1583062350805; 
 Sun, 01 Mar 2020 03:32:30 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id 17sm5675999qkc.81.2020.03.01.03.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 03:32:30 -0800 (PST)
Date: Sun, 1 Mar 2020 06:32:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v2 0/3] virtio-net: introduce features defined in the spec
Message-ID: <20200301063121-mutt-send-email-mst@kernel.org>
References: <20200301110733.20197-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20200301110733.20197-1-yuri.benditovich@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: yan@daynix.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Sun, Mar 01, 2020 at 01:07:30PM +0200, Yuri Benditovich wrote:
> This series introduce virtio-net features VIRTIO_NET_F_RSC_EXT,
> VIRTIO_NET_F_RSS and VIRTIO_NET_F_HASH_REPORT.
> 
> Changes from v1:
> __virtio -> __le
> maximal -> maximum
> minor style fixes


Looks good to me - sent a bit of consmetics.

But as any virtio UAPI change, please CC virtio-dev as virtio TC maintains the
interface. Thanks!

> Yuri Benditovich (3):
>   virtio-net: Introduce extended RSC feature
>   virtio-net: Introduce RSS receive steering feature
>   virtio-net: Introduce hash report feature
> 
>  include/uapi/linux/virtio_net.h | 90 +++++++++++++++++++++++++++++++--
>  1 file changed, 86 insertions(+), 4 deletions(-)
> 
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
