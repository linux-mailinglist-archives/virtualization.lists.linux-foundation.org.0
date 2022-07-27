Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A1158264E
	for <lists.virtualization@lfdr.de>; Wed, 27 Jul 2022 14:23:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2159081BF4;
	Wed, 27 Jul 2022 12:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2159081BF4
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hCPjI7zQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfJQ6KTcdtAj; Wed, 27 Jul 2022 12:22:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CA6EF81C6F;
	Wed, 27 Jul 2022 12:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA6EF81C6F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EFBCC0078;
	Wed, 27 Jul 2022 12:22:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C412C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jul 2022 12:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1677781C6F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jul 2022 12:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1677781C6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joFSoOCHxqFx
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jul 2022 12:22:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A4A781BF4
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A4A781BF4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jul 2022 12:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658924572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k2Ka0CTSNUje69lzv8PJ/TPp2RlYweVKt52OqRvsIcU=;
 b=hCPjI7zQPCfst0GfVOIft5gYFi0J2RnW3gA55o8qCYZBG4fCufgAR/unNFz9uZFLpjK4Bw
 PkrBCmYz5h3D6HkPeKu4XFiPAn8HMBrRbKCbf9wOsu2og+50Wunsru2/HFrjFH+1YcJYgb
 CpakS+R6S5/Kf7NWnNdwr6EKb69jpvw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-2TmEXlPSPbC0jDULPWHnJQ-1; Wed, 27 Jul 2022 08:22:49 -0400
X-MC-Unique: 2TmEXlPSPbC0jDULPWHnJQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 n7-20020adfc607000000b0021a37d8f93aso2814918wrg.21
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jul 2022 05:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k2Ka0CTSNUje69lzv8PJ/TPp2RlYweVKt52OqRvsIcU=;
 b=v3P6FWLJX1M73vBGf7rYIlebxtmZ4SBnIgvrvlGrd7aK5hvjRvbx73/vm+osp8ktqr
 Hboq6lzgTvja9EpV4LXh+SicCNoYsufkWViO3aHhqEid55d83dyYipaeWynMtFgelSlN
 zrTLTgaa/gmTIsYaZ18eRyIo8+tWLkOg9x8F9Ev21Atws4SQfEmyekd3h5MuwzdKV2an
 NVY4WY9XlyWcvsYpF0r3u7bfvzy7GttDXdBw2jI19KuWqwMtZttyUP+MelVDCpQSFpxx
 IWC6M9vKH1WCoUX63KolaXqui3zygCMrF9eeZNcGlXFqXkhDiLZn5zRvaa+XcG3F8/CM
 oysA==
X-Gm-Message-State: AJIora+VS0vwsWPLXWQlTuq0mpbSItP/h3O85ZjpkMv19QEO08Lgv64J
 qZOghSrKbzXqj+xJLI+g/8FCzIkgsLOnXlJY4BHhy+4Zv4GRUQ0E2FP9HeK272xvtH7UJyv6ifG
 hY1clY8f/jKExijxO49KTJeN9WlER43UaxDPG4nz2MQ==
X-Received: by 2002:a7b:ca57:0:b0:3a3:205d:2533 with SMTP id
 m23-20020a7bca57000000b003a3205d2533mr2850185wml.67.1658924567788; 
 Wed, 27 Jul 2022 05:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1teiq1UKtrMdPdEkg4fkBnI9UGCnKXnu+86rN3hnX5P6j17GO3+sGhJ6NqbsUNOXvFAHuGSxQ==
X-Received: by 2002:a7b:ca57:0:b0:3a3:205d:2533 with SMTP id
 m23-20020a7bca57000000b003a3205d2533mr2850159wml.67.1658924567308; 
 Wed, 27 Jul 2022 05:22:47 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-178.retail.telecomitalia.it.
 [79.46.200.178]) by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm13639242wrp.68.2022.07.27.05.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 05:22:46 -0700 (PDT)
Date: Wed, 27 Jul 2022 14:22:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>,
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Subject: Re: [RFC PATCH v2 3/9] vmci/vsock: use 'target' in notify_poll_in,
 callback
Message-ID: <20220727122241.mrafnepbelcboo5i@sgarzare-redhat>
References: <19e25833-5f5c-f9b9-ac0f-1945ea17638d@sberdevices.ru>
 <355f4bb6-82e7-2400-83e9-c704a7ef92f3@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <355f4bb6-82e7-2400-83e9-c704a7ef92f3@sberdevices.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "wei.liu@kernel.org" <wei.liu@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "sthemmin@microsoft.com" <sthemmin@microsoft.com>,
 Krasnov Arseniy <oxffffaa@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "edumazet@google.com" <edumazet@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, kernel <kernel@sberdevices.ru>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

@Jorgen can you take a look at this series, especially this patch?

Maybe we need to update the comments in the else branch, something like
s/there is nothing/there is not enough data

Thanks,
Stefano

On Mon, Jul 25, 2022 at 08:01:01AM +0000, Arseniy Krasnov wrote:
>This callback controls setting of POLLIN,POLLRDNORM output bits of poll()
>syscall,but in some cases,it is incorrectly to set it, when socket has
>at least 1 bytes of available data. Use 'target' which is already exists
>and equal to sk_rcvlowat in this case.
>
>Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>---
> net/vmw_vsock/vmci_transport_notify.c        | 2 +-
> net/vmw_vsock/vmci_transport_notify_qstate.c | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/net/vmw_vsock/vmci_transport_notify.c b/net/vmw_vsock/vmci_transport_notify.c
>index d69fc4b595ad..1684b85b0660 100644
>--- a/net/vmw_vsock/vmci_transport_notify.c
>+++ b/net/vmw_vsock/vmci_transport_notify.c
>@@ -340,7 +340,7 @@ vmci_transport_notify_pkt_poll_in(struct sock *sk,
> {
> 	struct vsock_sock *vsk = vsock_sk(sk);
>
>-	if (vsock_stream_has_data(vsk)) {
>+	if (vsock_stream_has_data(vsk) >= target) {
> 		*data_ready_now = true;
> 	} else {
> 		/* We can't read right now because there is nothing in the
>diff --git a/net/vmw_vsock/vmci_transport_notify_qstate.c b/net/vmw_vsock/vmci_transport_notify_qstate.c
>index 0f36d7c45db3..a40407872b53 100644
>--- a/net/vmw_vsock/vmci_transport_notify_qstate.c
>+++ b/net/vmw_vsock/vmci_transport_notify_qstate.c
>@@ -161,7 +161,7 @@ vmci_transport_notify_pkt_poll_in(struct sock *sk,
> {
> 	struct vsock_sock *vsk = vsock_sk(sk);
>
>-	if (vsock_stream_has_data(vsk)) {
>+	if (vsock_stream_has_data(vsk) >= target) {
> 		*data_ready_now = true;
> 	} else {
> 		/* We can't read right now because there is nothing in the
>-- 
>2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
