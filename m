Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5781C3B81CB
	for <lists.virtualization@lfdr.de>; Wed, 30 Jun 2021 14:12:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E029E826D6;
	Wed, 30 Jun 2021 12:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVYxA-ZEP_1G; Wed, 30 Jun 2021 12:12:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B7B3283B26;
	Wed, 30 Jun 2021 12:12:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44DF7C000E;
	Wed, 30 Jun 2021 12:12:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 986E5C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 12:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86A6C605C2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 12:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkGJhetv_Twx
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 12:12:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36846608FC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 12:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625055137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IgkWdNwml5AbnxYQNYHxxHeoFVm9yVfptJ5ZSxaAHBs=;
 b=DIJcSOACTWF8+Xb6Edp+PkdP9H5Tau3rHbUnKUmuh+EeDsIqKpveIHTUc+VKC02K4EQRyM
 NRVKdQfUkxVdf041FkClqJg3jzt+egrmgP/19SJhFt08TZC6ffJsYX0Y3IxUtmfENa2RL3
 x7IuFBmKuQSJtJV7fNSIrLj4VIpLjso=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-tENgMhp7OjShyXQrgtT0jA-1; Wed, 30 Jun 2021 08:12:14 -0400
X-MC-Unique: tENgMhp7OjShyXQrgtT0jA-1
Received: by mail-ej1-f70.google.com with SMTP id
 w22-20020a17090652d6b029048a3391d9f6so688832ejn.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 05:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IgkWdNwml5AbnxYQNYHxxHeoFVm9yVfptJ5ZSxaAHBs=;
 b=fCvI7JkYho1FKvyR0YSE/zNblTa1IgdxQFQeP2dsI4il4kWgFMU0nJkl3QoHnV1s6C
 KayJi9zyAzV3+ltmNtUh95RPgX+/MFUFmpRyDhDjXDtEj/oba/AdAQC8yPvS8AnSLIku
 jH8U7utlg1+nvTrcQz56TrBse+BvrF84HFNyPhOEQ6hw1xOFTRm0owaawmpfimQwmG5t
 LJVk7mOTr7U+jsbDFtpWSJa6xuDdu2KhCf7i8YBXoLDj03CvD9qCRRzHIxBruGC2k4Od
 nUAmq6UPlaRqyuoEdhoy8Kr0sbCtyZJrGqptnq4Pclmu8TVA3x/Fu+cAuuyWyFMgDB8d
 NXqg==
X-Gm-Message-State: AOAM532dVCxw8D705WpE6NHOsVLqH3zN9nOFtMAY8+ebT1r2Er2e5oEv
 65Ta+cPnmbinDPfrtqSZsolbxniAyuPMWROR4i6+M8O/afqG/g/WQp37lwdAthaSEX32WUwsUVH
 Mi0OpYEs6MtXqhqfD78/JmJr48X2fzSO3TquMY/Tglw==
X-Received: by 2002:a17:906:9516:: with SMTP id
 u22mr35503404ejx.442.1625055133032; 
 Wed, 30 Jun 2021 05:12:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1RNet7hJTadLeI9Tsu08HSFKQO+PCkN7Ksy3Me0p9lWphUkAZUHtlvFpAt4l+roFjoyUJXw==
X-Received: by 2002:a17:906:9516:: with SMTP id
 u22mr35503385ejx.442.1625055132807; 
 Wed, 30 Jun 2021 05:12:12 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id b17sm3361405edd.58.2021.06.30.05.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 05:12:12 -0700 (PDT)
Date: Wed, 30 Jun 2021 14:12:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v1 08/16] af_vsock: change SEQPACKET receive loop
Message-ID: <CAGxU2F5XtfKJ9cnK=J-gz4uW0AR9FsMc1Dq2jQx=dPGLRC+NTQ@mail.gmail.com>
References: <20210628095959.569772-1-arseny.krasnov@kaspersky.com>
 <20210628100331.571056-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210628100331.571056-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>, kvm <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev <netdev@vger.kernel.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Krasnov Arseniy <oxffffaa@gmail.com>, Norbert Slusarek <nslusarek@gmx.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Mon, Jun 28, 2021 at 01:03:28PM +0300, Arseny Krasnov wrote:
>Receive "loop" now really loop: it reads fragments one by
>one, sleeping if queue is empty.
>
>NOTE: 'msg_ready' pointer is not passed to 'seqpacket_dequeue()'
>here - it change callback interface, so it is moved to next patch.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> net/vmw_vsock/af_vsock.c | 31 ++++++++++++++++++++++---------
> 1 file changed, 22 insertions(+), 9 deletions(-)

I think you can merge patches 8, 9, and 10 together since we
are touching the seqpacket_dequeue() behaviour.

Then you can remove in separate patches the unneeded parts (e.g.
seqpacket_has_data, msg_count, etc.).

Thanks,
Stefano

>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 59ce35da2e5b..9552f05119f2 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2003,6 +2003,7 @@ static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr *msg,
>                                    size_t len, int flags)
> {
>       const struct vsock_transport *transport;
>+      bool msg_ready;
>       struct vsock_sock *vsk;
>       ssize_t record_len;
>       long timeout;
>@@ -2013,23 +2014,36 @@ static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr *msg,
>       transport = vsk->transport;
>
>       timeout = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
>+      msg_ready = false;
>+      record_len = 0;
>
>-      err = vsock_connectible_wait_data(sk, &wait, timeout, NULL, 0);
>-      if (err <= 0)
>-              goto out;
>+      while (!msg_ready) {
>+              ssize_t fragment_len;
>+              int intr_err;
>
>-      record_len = transport->seqpacket_dequeue(vsk, msg, flags);
>+              intr_err = vsock_connectible_wait_data(sk, &wait, timeout, NULL, 0);
>+              if (intr_err <= 0) {
>+                      err = intr_err;
>+                      break;
>+              }
>
>-      if (record_len < 0) {
>-              err = -ENOMEM;
>-              goto out;
>+              fragment_len = transport->seqpacket_dequeue(vsk, msg, flags);
>+
>+              if (fragment_len < 0) {
>+                      err = -ENOMEM;
>+                      break;
>+              }
>+
>+              record_len += fragment_len;
>       }
>
>       if (sk->sk_err) {
>               err = -sk->sk_err;
>       } else if (sk->sk_shutdown & RCV_SHUTDOWN) {
>               err = 0;
>-      } else {
>+      }
>+
>+      if (msg_ready && !err) {
>               /* User sets MSG_TRUNC, so return real length of
>                * packet.
>                */
>@@ -2045,7 +2059,6 @@ static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr *msg,
>                       msg->msg_flags |= MSG_TRUNC;
>       }
>
>-out:
>       return err;
> }
>
>--
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
