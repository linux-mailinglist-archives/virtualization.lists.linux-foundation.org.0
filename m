Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 55686203BBA
	for <lists.virtualization@lfdr.de>; Mon, 22 Jun 2020 18:01:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CD3DA25C1B;
	Mon, 22 Jun 2020 16:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pCvPYmCYeQt; Mon, 22 Jun 2020 16:01:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 60FF3261F3;
	Mon, 22 Jun 2020 16:01:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45872C0891;
	Mon, 22 Jun 2020 16:01:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 050FFC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E7E5087268
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xAOEzRyhBrc6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:00:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3EB5B87252
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592841658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVVo1o4umZNzjH+FG7Lke6lFdsLIhTFS1KQNZFyeoJQ=;
 b=SQ3n3L7e+CItlcKTdJ4g+Sskl0IyzIeGiNWiae3PRjaVvLSBXKMnvDXKrraZUJNJOhuv+2
 MSnqXF/XlsTM2F5Pl+nwqBflA1/jMXF7wCQE1DXRsNX0+c7mB5g+cvOAIFv2EihySTunsc
 REpXr+UtF3+kUXNRDNJjYdTuxqDN8ww=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-QEw3Lpt6NB2fUftMuhjJqQ-1; Mon, 22 Jun 2020 12:00:52 -0400
X-MC-Unique: QEw3Lpt6NB2fUftMuhjJqQ-1
Received: by mail-wr1-f72.google.com with SMTP id w4so11136760wrl.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KVVo1o4umZNzjH+FG7Lke6lFdsLIhTFS1KQNZFyeoJQ=;
 b=IyyUza/V28B9zUiQCLUj9OCKspzKvu9tBILFoy8lznJ6pPcT3wtd4c83YioV01I4Oh
 WHxVXt8GS0QLtDt8cMI9JhEshow5VgOGKQnXQR2NiixbE0kHkOeg7/+B3Ezhrf3276Di
 /0XC0MdtmfQ3XrAE+6BjicJ8W9W0PM6jzpjG7s6/taWAeO+jOO/znPvhdIE8OtcBL4XG
 DIlVMCar/KsvpExhNDS40tZBO1SHSm2KHWLzVVP8776KoDZl+7pgSVlPMVRBUnDEHUIq
 6bQAeMdsn0xQJtG6IrINLiZsVLua4YDNkCWdfnoLGNQtnAaeuHM0bUBzfkxb8tZOKdri
 ydrw==
X-Gm-Message-State: AOAM530GJK9Cz82GXiLibEmVQthBy1bgw0qvEA+Is5zB2kmB6WsALNm7
 cJBXUj5v+MVCHAuNZmC1X1Cl/4u7zeRWvMNGDcR9sOktgntH57gDtisXJ9aYlEFBnZ/i2nsifHn
 /G8tDEnwp7PkMxPURqh+Ixpb0omTuJC9zw/egmmifcw==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr20342978wmj.121.1592841651733; 
 Mon, 22 Jun 2020 09:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvgPO5JBany+h/NfYkGnwDtTNClIm0IeoiYnCbawxbhnKhPFgGcHzSS6vD+M99GoPOJKnLZg==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr20342963wmj.121.1592841651583; 
 Mon, 22 Jun 2020 09:00:51 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id 125sm2256wmc.23.2020.06.22.09.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 09:00:50 -0700 (PDT)
Date: Mon, 22 Jun 2020 12:00:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200622115946-mutt-send-email-mst@kernel.org>
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
 <0332b0cf-cf00-9216-042c-e870efa33626@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0332b0cf-cf00-9216-042c-e870efa33626@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMTE6MTk6MjZBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMTEg5LiL5Y2INzozNCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gICBzdGF0aWMgdm9pZCB2aG9zdF92cV9mcmVlX2lvdmVjcyhzdHJ1Y3Qgdmhvc3Rfdmly
dHF1ZXVlICp2cSkKPiA+ICAgewo+ID4gICAJa2ZyZWUodnEtPmRlc2NzKTsKPiA+IEBAIC0zOTQs
NiArNDAwLDkgQEAgc3RhdGljIGxvbmcgdmhvc3RfZGV2X2FsbG9jX2lvdmVjcyhzdHJ1Y3Qgdmhv
c3RfZGV2ICpkZXYpCj4gPiAgIAlmb3IgKGkgPSAwOyBpIDwgZGV2LT5udnFzOyArK2kpIHsKPiA+
ICAgCQl2cSA9IGRldi0+dnFzW2ldOwo+ID4gICAJCXZxLT5tYXhfZGVzY3MgPSBkZXYtPmlvdl9s
aW1pdDsKPiA+ICsJCWlmICh2aG9zdF92cV9udW1fYmF0Y2hfZGVzY3ModnEpIDwgMCkgewo+ID4g
KwkJCXJldHVybiAtRUlOVkFMOwo+ID4gKwkJfQo+IAo+IAo+IFRoaXMgY2hlY2sgYnJlYWtzIHZk
cGEgd2hpY2ggc2V0IGlvdl9saW1pdCB0byB6ZXJvLiBDb25zaWRlciBpb3ZfbGltaXQgaXMKPiBt
ZWFuaW5nbGVzcyB0byB2RFBBLCBJIHdvbmRlciB3ZSBjYW4gc2tpcCB0aGUgdGVzdCB3aGVuIGRl
dmljZSBkb2Vzbid0IHVzZQo+IHdvcmtlci4KPiAKPiBUaGFua3MKCkl0IGRvZXNuJ3QgbmVlZCBp
b3ZlY3MgYXQgYWxsLCByaWdodD8KCi0tIApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
