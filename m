Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E99FC6B8A51
	for <lists.virtualization@lfdr.de>; Tue, 14 Mar 2023 06:29:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B34B461020;
	Tue, 14 Mar 2023 05:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B34B461020
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IkNmzKkJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jB4_P5Gtdixl; Tue, 14 Mar 2023 05:29:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5151761017;
	Tue, 14 Mar 2023 05:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5151761017
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A92CC008A;
	Tue, 14 Mar 2023 05:29:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4225C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Mar 2023 05:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1C4C40377
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Mar 2023 05:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1C4C40377
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=IkNmzKkJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcmwByZpsV4o
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Mar 2023 05:29:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA1FC4011F
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA1FC4011F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Mar 2023 05:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678771772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJaJtyZElf3H3BV9WMunbsBk6Wy0+cZ88YgL+rMjeL0=;
 b=IkNmzKkJpFex2APIimd2ho3NXRDPDk+8iB6Yjcobw9j/9rwEX4CBhIZ78BApd+vSWDCpHr
 nMKHDwsB5M9m2iGx/53whJpgvQFCaWtQ0ph3tmE826+UzHGvBiYooODzBzallJFrGNGjck
 KKJXAH+JSxgYnjJ3YYkloyW3FlgQ/ac=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-8lRpLaULOq-RusZjv3F21A-1; Tue, 14 Mar 2023 01:29:29 -0400
X-MC-Unique: 8lRpLaULOq-RusZjv3F21A-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-177bf70751bso2379595fac.16
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Mar 2023 22:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678771768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJaJtyZElf3H3BV9WMunbsBk6Wy0+cZ88YgL+rMjeL0=;
 b=r/gHe+NeGY+ouLyrQmvvBJX5+xk0lTcb7/kozqyc/oPA9PD9jgJUDalyhBkxQgPuyI
 hnkMuwiHROIOzQVHQOXmnqs7a5dPYJ/cNKvO9mOUWkan9U3c4tst1hn+t+nGULv3z69Y
 XDmEHF17PdxzoxkJosdufu/bCQWO25QB6WeEbev0CjOL1l53Eqv/vTXDYkJWchpm9Rws
 U2BjQ5+6fbZj1IOD9Z1IJNpNe9ZYR7AfJD2oyxlrJX/m+erxajPjA2ihaDiGLuyKwRGp
 QgnOZjRAXZ2pyn/ZABQwHHgVTs9D9gUxNxCYlIZlxZWQyJ7eONGk68iRM1EFCLR43gdE
 LUcw==
X-Gm-Message-State: AO0yUKWUDj7Bj6fRFXi4VN59M+OPQlUak9/Hwa8qi8HLPdIHQeK9Ho8z
 EAt/j/xDqO5P+8SsQOdXmuhVZeZKJQ5mePQdCLGwXwaaY6aui+9hBDZH5D+fuYnXWPf7UufqNA7
 pbUcjondIDhXaV0HsvI5eAXwg1lQ+ZE3QvSUcZkl/tcQiZoCSFmbb+D/ZfA==
X-Received: by 2002:a05:6808:1d5:b0:384:c4a:1b49 with SMTP id
 x21-20020a05680801d500b003840c4a1b49mr11037013oic.9.1678771768243; 
 Mon, 13 Mar 2023 22:29:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set+o8i1lfkzceq+A3k7gDJp9H5U19t9lpynkbWQFal5+Am3M23o1nSJwGmw8kMBWAW9QnQ20MDn+NIXCXmyERSU=
X-Received: by 2002:a05:6808:1d5:b0:384:c4a:1b49 with SMTP id
 x21-20020a05680801d500b003840c4a1b49mr11037001oic.9.1678771767898; Mon, 13
 Mar 2023 22:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230302113421.174582-1-sgarzare@redhat.com>
 <20230302113421.174582-8-sgarzare@redhat.com>
In-Reply-To: <20230302113421.174582-8-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Mar 2023 13:29:16 +0800
Message-ID: <CACGkMEuCUBQeg0gLUjBXff=zMf-=qJqhMpdeUvTDk55Gz6tAVA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] vdpa_sim: replace the spinlock with a mutex to
 protect the state
To: Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, stefanha@redhat.com
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

T24gVGh1LCBNYXIgMiwgMjAyMyBhdCA3OjM14oCvUE0gU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2Fy
emFyZUByZWRoYXQuY29tPiB3cm90ZToKPgo+IFRoZSBzcGlubG9jayB3ZSB1c2UgdG8gcHJvdGVj
dCB0aGUgc3RhdGUgb2YgdGhlIHNpbXVsYXRvciBpcyBzb21ldGltZXMKPiBoZWxkIGZvciBhIGxv
bmcgdGltZSAoZm9yIGV4YW1wbGUsIHdoZW4gZGV2aWNlcyBoYW5kbGUgcmVxdWVzdHMpLgo+Cj4g
VGhpcyBhbHNvIHByZXZlbnRzIHVzIGZyb20gY2FsbGluZyBmdW5jdGlvbnMgdGhhdCBtaWdodCBz
bGVlcCAoc3VjaCBhcwo+IGt0aHJlYWRfZmx1c2hfd29yaygpIGluIHRoZSBuZXh0IHBhdGNoKSwg
YW5kIHRodXMgaGF2aW5nIHRvIHJlbGVhc2UKPiBhbmQgcmV0YWtlIHRoZSBsb2NrLgo+Cj4gRm9y
IHRoZXNlIHJlYXNvbnMsIGxldCdzIHJlcGxhY2UgdGhlIHNwaW5sb2NrIHdpdGggYSBtdXRleCB0
aGF0IGdpdmVzCj4gdXMgbW9yZSBmbGV4aWJpbGl0eS4KPgo+IFN1Z2dlc3RlZC1ieTogSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIEdhcnph
cmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+CgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KClRoYW5rcwoKPiAtLS0KPiAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3Zk
cGFfc2ltLmggICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0u
YyAgICAgfCAzNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvdmRwYS92
ZHBhX3NpbS92ZHBhX3NpbV9ibGsuYyB8ICA0ICsrLS0KPiAgZHJpdmVycy92ZHBhL3ZkcGFfc2lt
L3ZkcGFfc2ltX25ldC5jIHwgIDQgKystLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlv
bnMoKyksIDIzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS92ZHBh
X3NpbS92ZHBhX3NpbS5oIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmgKPiBpbmRl
eCBjZTgzZjkxMzBhNWQuLjQ3NzQyOTJmYmE4YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEv
dmRwYV9zaW0vdmRwYV9zaW0uaAo+ICsrKyBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3Np
bS5oCj4gQEAgLTYwLDggKzYwLDggQEAgc3RydWN0IHZkcGFzaW0gewo+ICAgICAgICAgc3RydWN0
IGt0aHJlYWRfd29ya2VyICp3b3JrZXI7Cj4gICAgICAgICBzdHJ1Y3Qga3RocmVhZF93b3JrIHdv
cms7Cj4gICAgICAgICBzdHJ1Y3QgdmRwYXNpbV9kZXZfYXR0ciBkZXZfYXR0cjsKPiAtICAgICAg
IC8qIHNwaW5sb2NrIHRvIHN5bmNocm9uaXplIHZpcnRxdWV1ZSBzdGF0ZSAqLwo+IC0gICAgICAg
c3BpbmxvY2tfdCBsb2NrOwo+ICsgICAgICAgLyogbXV0ZXggdG8gc3luY2hyb25pemUgdmlydHF1
ZXVlIHN0YXRlICovCj4gKyAgICAgICBzdHJ1Y3QgbXV0ZXggbXV0ZXg7Cj4gICAgICAgICAvKiB2
aXJ0aW8gY29uZmlnIGFjY29yZGluZyB0byBkZXZpY2UgdHlwZSAqLwo+ICAgICAgICAgdm9pZCAq
Y29uZmlnOwo+ICAgICAgICAgc3RydWN0IHZob3N0X2lvdGxiICppb21tdTsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9z
aW0vdmRwYV9zaW0uYwo+IGluZGV4IDZmZWIyOTcyNmMyYS4uYTI4MTAzYTY3YWU3IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCj4gKysrIGIvZHJpdmVycy92
ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiBAQCAtMTY2LDcgKzE2Niw3IEBAIHN0cnVjdCB2ZHBh
c2ltICp2ZHBhc2ltX2NyZWF0ZShzdHJ1Y3QgdmRwYXNpbV9kZXZfYXR0ciAqZGV2X2F0dHIsCj4g
ICAgICAgICBpZiAoSVNfRVJSKHZkcGFzaW0tPndvcmtlcikpCj4gICAgICAgICAgICAgICAgIGdv
dG8gZXJyX2lvbW11Owo+Cj4gLSAgICAgICBzcGluX2xvY2tfaW5pdCgmdmRwYXNpbS0+bG9jayk7
Cj4gKyAgICAgICBtdXRleF9pbml0KCZ2ZHBhc2ltLT5tdXRleCk7Cj4gICAgICAgICBzcGluX2xv
Y2tfaW5pdCgmdmRwYXNpbS0+aW9tbXVfbG9jayk7Cj4KPiAgICAgICAgIGRldiA9ICZ2ZHBhc2lt
LT52ZHBhLmRldjsKPiBAQCAtMjc1LDEzICsyNzUsMTMgQEAgc3RhdGljIHZvaWQgdmRwYXNpbV9z
ZXRfdnFfcmVhZHkoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhLCB1MTYgaWR4LCBib29sIHJlYWR5
KQo+ICAgICAgICAgc3RydWN0IHZkcGFzaW1fdmlydHF1ZXVlICp2cSA9ICZ2ZHBhc2ltLT52cXNb
aWR4XTsKPiAgICAgICAgIGJvb2wgb2xkX3JlYWR5Owo+Cj4gLSAgICAgICBzcGluX2xvY2soJnZk
cGFzaW0tPmxvY2spOwo+ICsgICAgICAgbXV0ZXhfbG9jaygmdmRwYXNpbS0+bXV0ZXgpOwo+ICAg
ICAgICAgb2xkX3JlYWR5ID0gdnEtPnJlYWR5Owo+ICAgICAgICAgdnEtPnJlYWR5ID0gcmVhZHk7
Cj4gICAgICAgICBpZiAodnEtPnJlYWR5ICYmICFvbGRfcmVhZHkpIHsKPiAgICAgICAgICAgICAg
ICAgdmRwYXNpbV9xdWV1ZV9yZWFkeSh2ZHBhc2ltLCBpZHgpOwo+ICAgICAgICAgfQo+IC0gICAg
ICAgc3Bpbl91bmxvY2soJnZkcGFzaW0tPmxvY2spOwo+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZ2
ZHBhc2ltLT5tdXRleCk7Cj4gIH0KPgo+ICBzdGF0aWMgYm9vbCB2ZHBhc2ltX2dldF92cV9yZWFk
eShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEsIHUxNiBpZHgpCj4gQEAgLTI5OSw5ICsyOTksOSBA
QCBzdGF0aWMgaW50IHZkcGFzaW1fc2V0X3ZxX3N0YXRlKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRw
YSwgdTE2IGlkeCwKPiAgICAgICAgIHN0cnVjdCB2ZHBhc2ltX3ZpcnRxdWV1ZSAqdnEgPSAmdmRw
YXNpbS0+dnFzW2lkeF07Cj4gICAgICAgICBzdHJ1Y3QgdnJpbmdoICp2cmggPSAmdnEtPnZyaW5n
Owo+Cj4gLSAgICAgICBzcGluX2xvY2soJnZkcGFzaW0tPmxvY2spOwo+ICsgICAgICAgbXV0ZXhf
bG9jaygmdmRwYXNpbS0+bXV0ZXgpOwo+ICAgICAgICAgdnJoLT5sYXN0X2F2YWlsX2lkeCA9IHN0
YXRlLT5zcGxpdC5hdmFpbF9pbmRleDsKPiAtICAgICAgIHNwaW5fdW5sb2NrKCZ2ZHBhc2ltLT5s
b2NrKTsKPiArICAgICAgIG11dGV4X3VubG9jaygmdmRwYXNpbS0+bXV0ZXgpOwo+Cj4gICAgICAg
ICByZXR1cm4gMDsKPiAgfQo+IEBAIC0zOTgsOSArMzk4LDkgQEAgc3RhdGljIHU4IHZkcGFzaW1f
Z2V0X3N0YXR1cyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEpCj4gICAgICAgICBzdHJ1Y3QgdmRw
YXNpbSAqdmRwYXNpbSA9IHZkcGFfdG9fc2ltKHZkcGEpOwo+ICAgICAgICAgdTggc3RhdHVzOwo+
Cj4gLSAgICAgICBzcGluX2xvY2soJnZkcGFzaW0tPmxvY2spOwo+ICsgICAgICAgbXV0ZXhfbG9j
aygmdmRwYXNpbS0+bXV0ZXgpOwo+ICAgICAgICAgc3RhdHVzID0gdmRwYXNpbS0+c3RhdHVzOwo+
IC0gICAgICAgc3Bpbl91bmxvY2soJnZkcGFzaW0tPmxvY2spOwo+ICsgICAgICAgbXV0ZXhfdW5s
b2NrKCZ2ZHBhc2ltLT5tdXRleCk7Cj4KPiAgICAgICAgIHJldHVybiBzdGF0dXM7Cj4gIH0KPiBA
QCAtNDA5LDE5ICs0MDksMTkgQEAgc3RhdGljIHZvaWQgdmRwYXNpbV9zZXRfc3RhdHVzKHN0cnVj
dCB2ZHBhX2RldmljZSAqdmRwYSwgdTggc3RhdHVzKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgdmRw
YXNpbSAqdmRwYXNpbSA9IHZkcGFfdG9fc2ltKHZkcGEpOwo+Cj4gLSAgICAgICBzcGluX2xvY2so
JnZkcGFzaW0tPmxvY2spOwo+ICsgICAgICAgbXV0ZXhfbG9jaygmdmRwYXNpbS0+bXV0ZXgpOwo+
ICAgICAgICAgdmRwYXNpbS0+c3RhdHVzID0gc3RhdHVzOwo+IC0gICAgICAgc3Bpbl91bmxvY2so
JnZkcGFzaW0tPmxvY2spOwo+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZ2ZHBhc2ltLT5tdXRleCk7
Cj4gIH0KPgo+ICBzdGF0aWMgaW50IHZkcGFzaW1fcmVzZXQoc3RydWN0IHZkcGFfZGV2aWNlICp2
ZHBhKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSA9IHZkcGFfdG9fc2lt
KHZkcGEpOwo+Cj4gLSAgICAgICBzcGluX2xvY2soJnZkcGFzaW0tPmxvY2spOwo+ICsgICAgICAg
bXV0ZXhfbG9jaygmdmRwYXNpbS0+bXV0ZXgpOwo+ICAgICAgICAgdmRwYXNpbS0+c3RhdHVzID0g
MDsKPiAgICAgICAgIHZkcGFzaW1fZG9fcmVzZXQodmRwYXNpbSk7Cj4gLSAgICAgICBzcGluX3Vu
bG9jaygmdmRwYXNpbS0+bG9jayk7Cj4gKyAgICAgICBtdXRleF91bmxvY2soJnZkcGFzaW0tPm11
dGV4KTsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPiBAQCAtNDMwLDkgKzQzMCw5IEBAIHN0
YXRpYyBpbnQgdmRwYXNpbV9zdXNwZW5kKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSkKPiAgewo+
ICAgICAgICAgc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0gPSB2ZHBhX3RvX3NpbSh2ZHBhKTsKPgo+
IC0gICAgICAgc3Bpbl9sb2NrKCZ2ZHBhc2ltLT5sb2NrKTsKPiArICAgICAgIG11dGV4X2xvY2so
JnZkcGFzaW0tPm11dGV4KTsKPiAgICAgICAgIHZkcGFzaW0tPnJ1bm5pbmcgPSBmYWxzZTsKPiAt
ICAgICAgIHNwaW5fdW5sb2NrKCZ2ZHBhc2ltLT5sb2NrKTsKPiArICAgICAgIG11dGV4X3VubG9j
aygmdmRwYXNpbS0+bXV0ZXgpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IEBAIC00NDIs
NyArNDQyLDcgQEAgc3RhdGljIGludCB2ZHBhc2ltX3Jlc3VtZShzdHJ1Y3QgdmRwYV9kZXZpY2Ug
KnZkcGEpCj4gICAgICAgICBzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSA9IHZkcGFfdG9fc2ltKHZk
cGEpOwo+ICAgICAgICAgaW50IGk7Cj4KPiAtICAgICAgIHNwaW5fbG9jaygmdmRwYXNpbS0+bG9j
ayk7Cj4gKyAgICAgICBtdXRleF9sb2NrKCZ2ZHBhc2ltLT5tdXRleCk7Cj4gICAgICAgICB2ZHBh
c2ltLT5ydW5uaW5nID0gdHJ1ZTsKPgo+ICAgICAgICAgaWYgKHZkcGFzaW0tPnBlbmRpbmdfa2lj
aykgewo+IEBAIC00NTMsNyArNDUzLDcgQEAgc3RhdGljIGludCB2ZHBhc2ltX3Jlc3VtZShzdHJ1
Y3QgdmRwYV9kZXZpY2UgKnZkcGEpCj4gICAgICAgICAgICAgICAgIHZkcGFzaW0tPnBlbmRpbmdf
a2ljayA9IGZhbHNlOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBzcGluX3VubG9jaygmdmRwYXNp
bS0+bG9jayk7Cj4gKyAgICAgICBtdXRleF91bmxvY2soJnZkcGFzaW0tPm11dGV4KTsKPgo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiBAQCAtNTI1LDE0ICs1MjUsMTQgQEAgc3RhdGljIGludCB2
ZHBhc2ltX3NldF9ncm91cF9hc2lkKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSwgdW5zaWduZWQg
aW50IGdyb3VwLAo+Cj4gICAgICAgICBpb21tdSA9ICZ2ZHBhc2ltLT5pb21tdVthc2lkXTsKPgo+
IC0gICAgICAgc3Bpbl9sb2NrKCZ2ZHBhc2ltLT5sb2NrKTsKPiArICAgICAgIG11dGV4X2xvY2so
JnZkcGFzaW0tPm11dGV4KTsKPgo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IHZkcGFzaW0tPmRl
dl9hdHRyLm52cXM7IGkrKykKPiAgICAgICAgICAgICAgICAgaWYgKHZkcGFzaW1fZ2V0X3ZxX2dy
b3VwKHZkcGEsIGkpID09IGdyb3VwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHZyaW5naF9z
ZXRfaW90bGIoJnZkcGFzaW0tPnZxc1tpXS52cmluZywgaW9tbXUsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmdmRwYXNpbS0+aW9tbXVfbG9jayk7Cj4KPiAtICAg
ICAgIHNwaW5fdW5sb2NrKCZ2ZHBhc2ltLT5sb2NrKTsKPiArICAgICAgIG11dGV4X3VubG9jaygm
dmRwYXNpbS0+bXV0ZXgpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW1fYmxrLmMgYi9kcml2ZXJzL3ZkcGEvdmRw
YV9zaW0vdmRwYV9zaW1fYmxrLmMKPiBpbmRleCBlYjQ4OTdjODU0MWUuLjU2ODExOWUxNTUzZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW1fYmxrLmMKPiArKysg
Yi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW1fYmxrLmMKPiBAQCAtMjkwLDcgKzI5MCw3
IEBAIHN0YXRpYyB2b2lkIHZkcGFzaW1fYmxrX3dvcmsoc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0p
Cj4gICAgICAgICBib29sIHJlc2NoZWR1bGUgPSBmYWxzZTsKPiAgICAgICAgIGludCBpOwo+Cj4g
LSAgICAgICBzcGluX2xvY2soJnZkcGFzaW0tPmxvY2spOwo+ICsgICAgICAgbXV0ZXhfbG9jaygm
dmRwYXNpbS0+bXV0ZXgpOwo+Cj4gICAgICAgICBpZiAoISh2ZHBhc2ltLT5zdGF0dXMgJiBWSVJU
SU9fQ09ORklHX1NfRFJJVkVSX09LKSkKPiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gQEAg
LTMyMSw3ICszMjEsNyBAQCBzdGF0aWMgdm9pZCB2ZHBhc2ltX2Jsa193b3JrKHN0cnVjdCB2ZHBh
c2ltICp2ZHBhc2ltKQo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gIG91dDoKPiAt
ICAgICAgIHNwaW5fdW5sb2NrKCZ2ZHBhc2ltLT5sb2NrKTsKPiArICAgICAgIG11dGV4X3VubG9j
aygmdmRwYXNpbS0+bXV0ZXgpOwo+Cj4gICAgICAgICBpZiAocmVzY2hlZHVsZSkKPiAgICAgICAg
ICAgICAgICAgdmRwYXNpbV9zY2hlZHVsZV93b3JrKHZkcGFzaW0pOwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW1fbmV0LmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9z
aW0vdmRwYV9zaW1fbmV0LmMKPiBpbmRleCBlNjFhOWVjYmZhZmUuLjdhYjQzNDU5MmJmZSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW1fbmV0LmMKPiArKysgYi9k
cml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW1fbmV0LmMKPiBAQCAtMjAxLDcgKzIwMSw3IEBA
IHN0YXRpYyB2b2lkIHZkcGFzaW1fbmV0X3dvcmsoc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0pCj4g
ICAgICAgICB1NjQgcnhfZHJvcHMgPSAwLCByeF9vdmVycnVucyA9IDAsIHJ4X2Vycm9ycyA9IDAs
IHR4X2Vycm9ycyA9IDA7Cj4gICAgICAgICBpbnQgZXJyOwo+Cj4gLSAgICAgICBzcGluX2xvY2so
JnZkcGFzaW0tPmxvY2spOwo+ICsgICAgICAgbXV0ZXhfbG9jaygmdmRwYXNpbS0+bXV0ZXgpOwo+
Cj4gICAgICAgICBpZiAoIXZkcGFzaW0tPnJ1bm5pbmcpCj4gICAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+IEBAIC0yNjQsNyArMjY0LDcgQEAgc3RhdGljIHZvaWQgdmRwYXNpbV9uZXRfd29yayhz
dHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSkKPiAgICAgICAgIH0KPgo+ICBvdXQ6Cj4gLSAgICAgICBz
cGluX3VubG9jaygmdmRwYXNpbS0+bG9jayk7Cj4gKyAgICAgICBtdXRleF91bmxvY2soJnZkcGFz
aW0tPm11dGV4KTsKPgo+ICAgICAgICAgdTY0X3N0YXRzX3VwZGF0ZV9iZWdpbigmbmV0LT50eF9z
dGF0cy5zeW5jcCk7Cj4gICAgICAgICBuZXQtPnR4X3N0YXRzLnBrdHMgKz0gdHhfcGt0czsKPiAt
LQo+IDIuMzkuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
