Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D523174F6B
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 21:07:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2ABB813FB;
	Sun,  1 Mar 2020 20:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9j4L5MrM3RcK; Sun,  1 Mar 2020 20:07:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 020D8858B5;
	Sun,  1 Mar 2020 20:07:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DABCDC013E;
	Sun,  1 Mar 2020 20:07:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0D13C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 20:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 02438815B5
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 20:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sz8cTsheb46
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 20:07:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2C92785BE4
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 20:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583093213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q7H4hPNYog/tbA35c9gkSElzqFK/7oYTQGCuX/AtR8g=;
 b=FBeDRpszggiVWbGaWiwGCjjbZeJ7rivizJSeiGbNvSNZKpvV2acdVkZDH6DpLqZt8LOx/P
 zdB3VRdxmFZ/ouxzpr8s9GBKr+ftVa9mdX47JWoGpKIcn0MZGziAkWMuEIiHPW8q6U4Q60
 g6VPDPBgFr2j5ww87zQ4U+hg8K0g14I=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-wpY2ETkmPoSM25RqnGJagw-1; Sun, 01 Mar 2020 15:06:52 -0500
X-MC-Unique: wpY2ETkmPoSM25RqnGJagw-1
Received: by mail-qv1-f71.google.com with SMTP id s5so7290928qvr.15
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 12:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q7H4hPNYog/tbA35c9gkSElzqFK/7oYTQGCuX/AtR8g=;
 b=X6K+L4IjPvni8o8skkuCv1GnZZXM9CnjhBE96FWAzOgRaX0rsKn9u18Ev93k3NPOR0
 9O/cJFywIEGq75qnVgZ2ufqqqvWZD9IRMZ6fzcDcnuVNwxgy7WQH4qQSY3aACSjvAUdx
 Yi8AmggShqPaJWdLHtJnL5GOFbzvQN+moPSq6JZheKoGDBYGbwnF9lmkMrO0Vm8rsRin
 sTVEypBtvgqr/JDfNwIAf1ZRd1nGIq2YAohplVUPn1FNlU3opIW0njij8p+BWL9qm4KK
 6TdviYVeigSOzikopd3PcyLxJbzQT5Pu5xl81Y39Qhp1MPfCg49P3DOC30YjXf4Wlhvu
 4peQ==
X-Gm-Message-State: ANhLgQ3FR+Z+/5GXsdrk8Pijmz/xSIQgqeCm3Kstjla9b5V4tRmB7E9q
 y+5j0zS9bfnyOCyYIZ1EXAFEnPqEsGr7jk5FH7ISV/LrSmWPariYISXchtd98jzPtKdr1m0GFuP
 gyTH7hJy8tUTjdsNCKCYAv4KDYk8B/2GQTb5qgo+ypA==
X-Received: by 2002:ac8:5183:: with SMTP id c3mr5374059qtn.299.1583093212058; 
 Sun, 01 Mar 2020 12:06:52 -0800 (PST)
X-Google-Smtp-Source: ADFU+vusETAvYjcJ1HtYXHojlWB1Rd8L85okakt1rmMuxTe8ftDDkfFDjav/Zq5ihrTjqaRXwNuMhw==
X-Received: by 2002:ac8:5183:: with SMTP id c3mr5374047qtn.299.1583093211820; 
 Sun, 01 Mar 2020 12:06:51 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id e2sm8930835qkb.112.2020.03.01.12.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 12:06:50 -0800 (PST)
Date: Sun, 1 Mar 2020 15:06:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v3 0/3] virtio-net: introduce features defined in the spec
Message-ID: <20200301150625-mutt-send-email-mst@kernel.org>
References: <20200301143302.8556-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20200301143302.8556-1-yuri.benditovich@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: yan@daynix.com, virtio-dev@lists.oasis-open.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Sun, Mar 01, 2020 at 04:32:59PM +0200, Yuri Benditovich wrote:
> This series introduce virtio-net features VIRTIO_NET_F_RSC_EXT,
> VIRTIO_NET_F_RSS and VIRTIO_NET_F_HASH_REPORT.
> 
> Changes from v2: reformatted structure in patch 1


Looks good but I cound a couple more nits. Sorry I missed them
on the previous read.

> Yuri Benditovich (3):
>   virtio-net: Introduce extended RSC feature
>   virtio-net: Introduce RSS receive steering feature
>   virtio-net: Introduce hash report feature
> 
>  include/uapi/linux/virtio_net.h | 100 ++++++++++++++++++++++++++++++--
>  1 file changed, 96 insertions(+), 4 deletions(-)
> 
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
