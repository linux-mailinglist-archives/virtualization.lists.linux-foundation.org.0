Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id DB41733A87D
	for <lists.virtualization@lfdr.de>; Sun, 14 Mar 2021 23:19:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687754AAB4;
	Sun, 14 Mar 2021 22:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_Kf981rs4bu; Sun, 14 Mar 2021 22:19:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07CE24B158;
	Sun, 14 Mar 2021 22:19:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B9F4C0001;
	Sun, 14 Mar 2021 22:19:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E12D3C0001
 for <virtualization@lists.linux-foundation.org>;
 Sun, 14 Mar 2021 22:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8C248346C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 14 Mar 2021 22:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DceHXrSC2GkQ
 for <virtualization@lists.linux-foundation.org>;
 Sun, 14 Mar 2021 22:19:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3CA983372
 for <virtualization@lists.linux-foundation.org>;
 Sun, 14 Mar 2021 22:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615760387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PLH0jp+7GSgU8hCIRc8NsJBVA47ImhoG3zJQMPj1ECY=;
 b=ClFcNFaTrviUchLkxX6kpBjE90nscG9TD1DjElT7xguL4Z2LDGCQemvYVzEinxL9L9sP+I
 tIAkD5k14DX8njhtsAFDyKNmiyMA359sQSiRGUMccCO4fagQkVCVlR0aZN0YLS3i//keyx
 g9Aj7w1QmRD9W7aCvDtX0CS7TwoSH7s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-kesw4PZwPRqnw2jnG6aV9A-1; Sun, 14 Mar 2021 18:19:45 -0400
X-MC-Unique: kesw4PZwPRqnw2jnG6aV9A-1
Received: by mail-wr1-f69.google.com with SMTP id h5so14165671wrr.17
 for <virtualization@lists.linux-foundation.org>;
 Sun, 14 Mar 2021 15:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PLH0jp+7GSgU8hCIRc8NsJBVA47ImhoG3zJQMPj1ECY=;
 b=k4inGGP9lCWqV68K8bAl7qtby0KazY5S18wbNhpbadDTX3LNcNtJA4RYylpW8Iczta
 ceU3CtBCX61p77Rdeua7v1bE3k4WHlVjddvL5/X7IIjKIP1P8o5Tz0h6p/o+G9P5Ra0v
 6CBzSKkRwGBj0ZEjYDWKOQ8jAIY14+QQLPjWMo+2cbE/Dce9PiZpEKS7W4BRp+xr5zB4
 +o2qN3oNPljyCintEEZlVgVFwHrWZkuYNcDbnXmfFEy8M9XcPZjNDD/QuxlZj2s2rmwE
 oZVU6+cziXnLjE0MQCE30e7kmfzMUhxvz1PkbX35sc/nRLETIkS0QOXW0Gw/VtjRCNhr
 6Rwg==
X-Gm-Message-State: AOAM532zyCzYmmJv72/EDgLPQuyKim9PXqAKruDkI8yv4hTr2lBefRPK
 Qe5IABtd/b+y1WZVl0k0+RGUwmAfDhUGceeMJfjpihRozyxKl9Vze0kV5ACEwrhNKjIj0r1VhUT
 w8Oa83eVGrBsSlhspg+P4wHQbONuGX0ZGTyoyf5ob0w==
X-Received: by 2002:a7b:c3c1:: with SMTP id t1mr22977894wmj.47.1615760384771; 
 Sun, 14 Mar 2021 15:19:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmG/5IfLoSJ8dXuQirPKAMro86czQUJR4hATtoi66TT+Zj9AXKRK64y2zNDrg0II+8nmFU+w==
X-Received: by 2002:a7b:c3c1:: with SMTP id t1mr22977886wmj.47.1615760384656; 
 Sun, 14 Mar 2021 15:19:44 -0700 (PDT)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id y18sm16849168wrw.39.2021.03.14.15.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 15:19:43 -0700 (PDT)
Date: Sun, 14 Mar 2021 18:19:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [External] Re: vsock virtio: questions about supporting DGRAM type
Message-ID: <20210314181308-mutt-send-email-mst@kernel.org>
References: <CAP_N_Z97rUvCSNoKAkxhyw9FJWQ2tJ0Wv5srHzR387j_S_6pjA@mail.gmail.com>
 <20210223045001-mutt-send-email-mst@kernel.org>
 <CAP_N_Z-Y+a9mHH8GCqnaR=ZP9gQiu26Op35oZWm2LHkvCQ7=qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z-Y+a9mHH8GCqnaR=ZP9gQiu26Op35oZWm2LHkvCQ7=qg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: cong.wang@bytedance.com, Xiongchun Duan <duanxiongchun@bytedance.com>,
 imbrenda@linux.vnet.ibm.com, xieyongji@bytedance.com, stefanha@redhat.com,
 asias@redhat.com, virtualization@lists.linux-foundation.org
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

On Thu, Mar 11, 2021 at 08:57:08PM -0800, Jiang Wang . wrote:
> Hi Michael,
> 
> Sorry for the late reply. I just saw your email yesterday somehow.
> 
> I read the email thread you mentioned, and I think the issue with
> dgram is that it may drop packets because the sender cannot track the
> tx_cnt with subtracting it from peer_fwd_cnt.
> 
> I agree with Stefan that the dgram is a best-effort service and may
> drop packets. For the sender, I just add a maximum buffer size to
> limit the memory usage. On the receiving side, I reuse the existing
> virtio_transport_inc_rx_pkt() that Stefano added a year ago to limit
> the memory usage. This will avoid denial of service attack to the
> other end (host or guest VM).
> 
> For the application of dgram, we will use it for some remote logging
> application. The application running in the VM will write some logs to
> a server running on the host. This is  one way communication and the
> log is not critical.
> 
> Regards,
> 
> Jiang

To make things short, please submit to the virtio TC a spec patch
documenting how is dgram supposed to work and we'll discuss.  The
existing mechanism was designed with a stream socket in mind.  dgram is
best-effort but some fairness could be a quality of implementation
issue.  I appreciate that your specific application might not care about
such concerns but we do need to worry about building a widely reuseable
interface as opposed to a very narrow one.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
