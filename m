Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 401581C6FFD
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 14:09:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D41A18851B;
	Wed,  6 May 2020 12:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYJufhIuC-X7; Wed,  6 May 2020 12:08:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EEA5088517;
	Wed,  6 May 2020 12:08:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF258C088B;
	Wed,  6 May 2020 12:08:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADC29C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 12:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E80124F56
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 12:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mdA3eIImH4I
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 12:08:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 1F828203EC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 12:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588766934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAmivG5aDvvl7e+GYdcGOegOdLibFaOeKZvY0VQjVvw=;
 b=Plbwo/PE2+V4u6YvfBr1uAWPQoOVp/i7AUUJYYmDt0zGGJR/7kVy7fYyo51ZH1gwt6RINM
 b9uMqjIpz35Ll6Z3VqSFpbYK1YVh2VrfMVDsTwS7EdYQLptV8nfRe856ViWAxOs66iESCb
 5wJ549L9/cs56FSDsmvhJr8l6ipJQFU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-qq79DbeZPTGm0evnI3YDxA-1; Wed, 06 May 2020 08:08:52 -0400
X-MC-Unique: qq79DbeZPTGm0evnI3YDxA-1
Received: by mail-wr1-f69.google.com with SMTP id f15so1217080wrj.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 05:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hAmivG5aDvvl7e+GYdcGOegOdLibFaOeKZvY0VQjVvw=;
 b=o79Uh9wgkMTKnOl197EwNK8VlsCWHaERqlGymFsV1dkWH55QRMhlcrTfWG1vVZBR+d
 G8u1L8cGtbBcMpFyCUf9Ib68qcI3q2/G991Eqzn6BLEkTcIZadpF6B7nzE6DYBUKJTZo
 XWctPgREfsOGQN86W/vOb6W2nPvXunlt4CeTyShGczhOrzxGZf8VjcXyYaW3CCNZa+En
 U23S+HiP1FxpoZqpSafO34V/eF4bQrCyCNWA4QfIabrt3tty6+U4SrIH+h0CI8f495T2
 KCKnvGeb/OAI4MOmFCH92xPGSQX/6AbYken/Pi5fskheT1FS/Dtil9sRglDcvD7+Hmak
 l4SQ==
X-Gm-Message-State: AGi0PuY0L2m+cu7ODudZh7COzrfBy9N8PoQVuUF16Gy19h8Hzh+1r0nV
 A6zXB/913hlMJP7JCKxvCtoL2Mfkgz6bNmKG6mCqNbSp4S+MXHjpt2VRys/7ihGmTFsRpElJ25+
 rQ6zBcGgq9iEnQpi4U2al+R0fJZMtaCJr5nxXFnWyOQ==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr4203999wma.32.1588766931870; 
 Wed, 06 May 2020 05:08:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypJBsIQXXLBh7+polD0/FRHAo1jIr0FLeGcQ49ZR50oVFkk3bBSfh+noTe2EUmUQ7wGzC4gACg==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr4203979wma.32.1588766931683; 
 Wed, 06 May 2020 05:08:51 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 s17sm2634468wmc.48.2020.05.06.05.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 05:08:51 -0700 (PDT)
Date: Wed, 6 May 2020 08:08:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next 2/2] virtio-net: fix the XDP truesize
 calculation for mergeable buffers
Message-ID: <20200506075807-mutt-send-email-mst@kernel.org>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506061633.16327-2-jasowang@redhat.com>
 <20200506033259-mutt-send-email-mst@kernel.org>
 <789fc6e6-9667-a609-c777-a9b1fed72f41@redhat.com>
MIME-Version: 1.0
In-Reply-To: <789fc6e6-9667-a609-c777-a9b1fed72f41@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-kernel@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCBNYXkgMDYsIDIwMjAgYXQgMDQ6MjE6MTVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzUvNiDkuIvljYgzOjM3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBXZWQsIE1heSAwNiwgMjAyMCBhdCAwMjoxNjozM1BNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBXZSBzaG91bGQgbm90IGV4Y2x1ZGUgaGVhZHJvb20gYW5kIHRhaWxyb29t
IHdoZW4gWERQIGlzIHNldC4gU28gdGhpcwo+ID4gPiBwYXRjaCBmaXhlcyB0aGlzIGJ5IGluaXRp
YWxpemluZyB0aGUgdHJ1ZXNpemUgZnJvbSBQQUdFX1NJWkUgd2hlbiBYRFAKPiA+ID4gaXMgc2V0
Lgo+ID4gPiAKPiA+ID4gQ2M6IEplc3BlciBEYW5nYWFyZCBCcm91ZXI8YnJvdWVyQHJlZGhhdC5j
b20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4K
PiA+IFNlZW1zIHRvbyBhZ2dyZXNzaXZlLCB3ZSBkbyBub3QgdXNlIHVwIHRoZSB3aG9sZSBwYWdl
IGZvciB0aGUgc2l6ZS4KPiA+IAo+ID4gCj4gPiAKPiAKPiBGb3IgWERQIHllcywgd2UgZG86Cj4g
Cj4gc3RhdGljIHVuc2lnbmVkIGludCBnZXRfbWVyZ2VhYmxlX2J1Zl9sZW4oc3RydWN0IHJlY2Vp
dmVfcXVldWUgKnJxLAo+IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqAgc3Ry
dWN0IGV3bWFfcGt0X2xlbiAqYXZnX3BrdF9sZW4sCj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoCB1bnNpZ25lZCBpbnQgcm9vbSkKPiB7Cj4gwqDCoMKgIGNvbnN0IHNpemVf
dCBoZHJfbGVuID0gc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fbmV0X2hkcl9tcmdfcnhidWYpOwo+IMKg
wqDCoCB1bnNpZ25lZCBpbnQgbGVuOwo+IAo+IMKgwqDCoCBpZiAocm9vbSkKPiDCoMKgwqAgwqDC
oMKgIHJldHVybiBQQUdFX1NJWkUgLSByb29tOwo+IAo+IC4uLgo+IAo+IFRoYW5rcwoKSG1tLiBC
dXQgdGhhdCdzIG9ubHkgZm9yIG5ldyBidWZmZXJzLiBCdWZmZXJzIHRoYXQgd2VyZSBvdXRzdGFu
ZGluZwpiZWZvcmUgeGRwIHdhcyBhdHRhY2hlZCBkb24ndCB1c2UgdGhlIHdob2xlIHBhZ2UsIGRv
IHRoZXk/CgoKCgpBbHNvLCB3aXRoIFRDUCBzbWFsbHF1ZXVlcyBibG9ja2luZyB0aGUgcXVldWUg
bGlrZSB0aGF0IG1pZ2h0IGJlIGEgcHJvYmxlbS4KQ291bGQgeW91IHRyeSBhbmQgY2hlY2sgcGVy
Zm9ybWFuY2UgaW1wYWN0IG9mIHRoaXM/CkkgbG9va2VkIGF0IHdoYXQgb3RoZXIgZHJpdmVycyBk
byBhbmQgSSBzZWUgdGhleSB0ZW5kIHRvIGNvcHkgdGhlIHNrYgppbiBYRFBfUEFTUyBjYXNlLiBB
VE0gd2UgZG9uJ3Qgbm9ybWFsbHkgLSBidXQgc2hvdWxkIHdlPwoKLS0gCk1TVAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
