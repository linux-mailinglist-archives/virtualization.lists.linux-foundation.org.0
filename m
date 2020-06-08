Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EC95C1F12DE
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 08:32:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A100A85C2E;
	Mon,  8 Jun 2020 06:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R12vLS9OtqST; Mon,  8 Jun 2020 06:32:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A40885BFB;
	Mon,  8 Jun 2020 06:32:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8F1FC016F;
	Mon,  8 Jun 2020 06:32:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A01C8C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9B1C186651
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dflTVajSYCPg
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:32:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CE7E08663C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591597969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHa43udsYNKZo7N6VKsAJNE6lMJI4Ma06bbThMjTBZc=;
 b=E+znX66PqYlcKhzCZFErXyHapDYqr5vEZUDPRxGmkfHUA8OcBTRvH+GFH1sQLFfUFljnWq
 9M/QsOcfb+Vu8INbzRQlWLKdD3TNJp1MlAAfhuPJUqraLe1Bpoa0EIOm8XSjC/ZyzzLyxa
 W9oBZN05HHdgqRNrS7NbytwMMFbBlF8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-x64DCkEkOrOfIzQbs8noDw-1; Mon, 08 Jun 2020 02:32:47 -0400
X-MC-Unique: x64DCkEkOrOfIzQbs8noDw-1
Received: by mail-wr1-f71.google.com with SMTP id c14so6696927wrw.11
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 23:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uHa43udsYNKZo7N6VKsAJNE6lMJI4Ma06bbThMjTBZc=;
 b=F7sAH5bljiqu8sW2SzBIl4DSFybqS0fnM4vzukQN0yVGlYO5L4NwZLFWn+8PgO0aKy
 ZygtZXgUlpR/54FfqOpoN8I9m1f86OONq/8S8YNYne/6FzgtKXt2dX+s2TWWKELHHbDc
 lVEt+jnqId2OID+WinQf/yb9n/KdnZg79nbCvzms8jFLKbXhDRO7RBULWERVLhPwrfV5
 VyM1Dm/7NR7sSp2Bdv+SA6ymPZ1No+jRFeExTkx49sSromUm473jvXIOjWbwFbySRlll
 ZTR3mywF1KuNMo3fHq7LXTfSXBPrtl30a8YHBvOwENsesGgJE+HwYvLBWglBbN96WKq7
 AxWA==
X-Gm-Message-State: AOAM533JUSqKLM5lr/LWEpzAv//McyTfcgX/ddICpVfrqsb8ktFLpOwF
 crCNLD0YVlYU+6XHyFpvzJQ3qH4NpUfDfC2TYeHeIGn9BRXXiNp9Lq/L5ed/tUvLW93Vp7yjnqG
 45j+I6jnIFzy+eqp88nngKhe1JICd+smISMdJ0rSlPw==
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr22588494wrp.398.1591597966538; 
 Sun, 07 Jun 2020 23:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHTpMMuo2IYOqOej95ECMKiyl7nT0Q76q7fFs8v5zZkhDNtkqrniK0oE26ia6RYqO77tX8Xg==
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr22588471wrp.398.1591597966374; 
 Sun, 07 Jun 2020 23:32:46 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 c16sm22492989wrx.4.2020.06.07.23.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 23:32:45 -0700 (PDT)
Date: Mon, 8 Jun 2020 02:32:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
Message-ID: <20200608021438-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
 <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
 <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

T24gTW9uLCBKdW4gMDgsIDIwMjAgYXQgMTE6MzI6MzFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvNyDkuIvljYg5OjUxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBGcmksIEp1biAwNSwgMjAyMCBhdCAwNDo1NDoxN1BNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzYvMiDkuIvljYgzOjA4LCBKYXNvbiBXYW5nIHdyb3RlOgo+
ID4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHZwX3ZkcGFfaWRf
dGFibGVbXSA9IHsKPiA+ID4gPiA+ID4gK8KgwqDCoCB7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9J
RF9SRURIQVRfUVVNUkFORVQsIFBDSV9BTllfSUQpIH0sCj4gPiA+ID4gPiA+ICvCoMKgwqAgeyAw
IH0KPiA+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiBUaGlzIGxvb2tzIGxpa2UgaXQnbGwgY3JlYXRl
IGEgbWVzcyB3aXRoIGVpdGhlciB2aXJ0aW8gcGNpCj4gPiA+ID4gPiBvciB2ZHBhIGJlaW5nIGxv
YWRlZCBhdCByYW5kb20uIE1heWJlIGp1c3QgZG9uJ3Qgc3BlY2lmeQo+ID4gPiA+ID4gYW55IElE
cyBmb3Igbm93LiBEb3duIHRoZSByb2FkIHdlIGNvdWxkIGdldCBhCj4gPiA+ID4gPiBkaXN0aW5j
dCB2ZW5kb3IgSUQgb3IgYSByYW5nZSBvZiBkZXZpY2UgSURzIGZvciB0aGlzLgo+ID4gPiA+IAo+
ID4gPiA+IFJpZ2h0LCB3aWxsIGRvLgo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcwo+ID4gPiAKPiA+
ID4gUmV0aGluayBhYm91dCB0aGlzLiBJZiB3ZSBkb24ndCBzcGVjaWZ5IGFueSBJRCwgdGhlIGJp
bmRpbmcgd29uJ3Qgd29yay4KPiA+IFdlIGNhbiBiaW5kIG1hbnVhbGx5LiBJdCdzIG5vdCByZWFs
bHkgZm9yIHByb2R1Y3Rpb24gYW55d2F5LCBzbwo+ID4gbm90IGEgYmlnIGRlYWwgaW1oby4KPiAK
PiAKPiBJIHRoaW5rIHlvdSBtZWFuIGRvaW5nIGl0IHZpYSAibmV3X2lkIiwgcmlnaHQuCgpJIHJl
YWxseSBtZWFudCBkcml2ZXJfb3ZlcnJpZGUuIFRoaXMgaXMgd2hhdCBwZW9wbGUgaGF2ZSBiZWVu
IHVzaW5nCndpdGggcGNpLXN0dWIgZm9yIHllYXJzIG5vdy4KCj4gCj4gPiAKPiA+ID4gSG93IGFi
b3V0IHVzaW5nIGEgZGVkaWNhdGVkIHN1YnN5c3RlbSB2ZW5kb3IgaWQgZm9yIHRoaXM/Cj4gPiA+
IAo+ID4gPiBUaGFua3MKPiA+IElmIHZpcnRpbyB2ZW5kb3IgaWQgaXMgdXNlZCB0aGVuIHN0YW5k
YXJkIGRyaXZlciBpcyBleHBlY3RlZAo+ID4gdG8gYmluZCwgcmlnaHQ/IE1heWJlIHVzZSBhIGRl
ZGljYXRlZCB2ZW5kb3IgaWQ/Cj4gCj4gCj4gSSBtZWFudCBzb21ldGhpbmcgbGlrZToKPiAKPiBz
dGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgdnBfdmRwYV9pZF90YWJsZVtdID0gewo+
IMKgwqDCoCB7IFBDSV9ERVZJQ0VfU1VCKFBDSV9WRU5ET1JfSURfUkVESEFUX1FVTVJBTkVULCBQ
Q0lfQU5ZX0lELAo+IFZQX1RFU1RfVkVORE9SX0lELCBWUF9URVNUX0RFVklDRV9JRCkgfSwKPiDC
oMKgwqAgeyAwIH0KPiB9Owo+IAo+IFRoYW5rcwo+IAoKVGhlbiByZWd1bGFyIHZpcnRpbyB3aWxs
IHN0aWxsIGJpbmQgdG8gaXQuIEl0IGhhcwoKZHJpdmVycy92aXJ0aW8vdmlydGlvX3BjaV9jb21t
b24uYzogICAgIHsgUENJX0RFVklDRShQQ0lfVkVORE9SX0lEX1JFREhBVF9RVU1SQU5FVCwgUENJ
X0FOWV9JRCkgfSwKCgotLSAKTVNUCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
