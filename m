Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B949F3E4
	for <lists.virtualization@lfdr.de>; Fri, 28 Jan 2022 07:57:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E9D260B43;
	Fri, 28 Jan 2022 06:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DuvobTNpgVom; Fri, 28 Jan 2022 06:57:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D0E3C60AFC;
	Fri, 28 Jan 2022 06:57:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EF9DC0031;
	Fri, 28 Jan 2022 06:57:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1277C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Jan 2022 06:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8C4484DFB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Jan 2022 06:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1P65uxsxdufF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Jan 2022 06:57:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCB3184DEF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Jan 2022 06:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643353036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hoR9Y1f2jHonl69jIVjtfl1NZy3bn027LYcSouPHOCA=;
 b=A+caUFQuuLnXAy0ILZkQ2yc0X2T8haG8luoYN6ETCgjZQp2WggcZRUfpoYl/zkqhAIXD/U
 a8sWzU1a041I8h43JOfi41tigoTidm1LXj7VlTPxljqtqEIcyJEi3I8NKnq09EWzSH02u7
 TYlC+ct89FRMR/rIRMWtDfP+lAfV6BI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-aUhxmzHYMTmt8M7Yo8OwZQ-1; Fri, 28 Jan 2022 01:57:13 -0500
X-MC-Unique: aUhxmzHYMTmt8M7Yo8OwZQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 y17-20020a170902d65100b0014a17faf0bdso2756752plh.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Jan 2022 22:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hoR9Y1f2jHonl69jIVjtfl1NZy3bn027LYcSouPHOCA=;
 b=OqAeNVn1bLGAMijs//W8LuSXCiW8cempDE3XTXMmHuQfIM/+v9QrGuMPoU2H2EZDob
 l6OWIhTDbqfRKy+GSMFxUD/aXJrHIDaeaTGouzHMe8z8uyyE3ootyGidpKp5wxbYowQS
 tBk68mtkXMQWh7PhlxDWV0X+tkJ8U97Ujr+WeZB1dYre3iw+PDtKYElHdsbhEVAQ+qoN
 xvkk7dSY8mE2thm7WbpKPwH6bHgd0qEDeZvLiCgR6I5089Y7r0r+Krtj4r9Mn2gK745n
 +zNa+yH++d+EIDGPykgGJ6epotNB2DnSMAxfI22UEL+/8tFnclkH5SruGHhidw9ZSWcI
 eedg==
X-Gm-Message-State: AOAM5337ilfWnZpTIJNn+tO7yzSFwroGUfsPRJ8Quwvs6U3qN4Y1f2Cq
 HNDy+Uw0ISg/1vto+GIQZQ2qt/AIot20vyQUHcQuCt9FADRnxlKyEEj9kHVvSiKz0J8nlv/6WJA
 VYJ0L9LdY64CrYW0MJRNVmmH6ltSi7+AnEPzDRIf/5w==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id
 lb12mr8201271pjb.211.1643353031858; 
 Thu, 27 Jan 2022 22:57:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWBbXSw4EH+rGgOI68sTw2G4dwbKWA9R9aZIkj+kSxOGwh1zp8Fv6sWqFo7rwALZOYIqg1aQ==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id
 lb12mr8201250pjb.211.1643353031546; 
 Thu, 27 Jan 2022 22:57:11 -0800 (PST)
Received: from [10.72.13.185] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id mi18sm1282013pjb.35.2022.01.27.22.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 22:57:10 -0800 (PST)
Message-ID: <2cb2415b-7d8b-6187-c202-27e8f26410a4@redhat.com>
Date: Fri, 28 Jan 2022 14:56:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 06/31] vhost: Route guest->host notification through
 shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-7-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Eric Blake <eblake@redhat.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CuWcqCAyMDIyLzEvMjIg5LiK5Y2INDoyNywgRXVnZW5pbyBQw6lyZXog5YaZ6YGTOgo+IEF0IHRo
aXMgbW9tZW50IG5vIGJ1ZmZlciBmb3J3YXJkaW5nIHdpbGwgYmUgcGVyZm9ybWVkIGluIFNWUSBt
b2RlOiBRZW11Cj4ganVzdCBmb3J3YXJkIHRoZSBndWVzdCdzIGtpY2tzIHRvIHRoZSBkZXZpY2Uu
IFRoaXMgY29tbWl0IGFsc28gc2V0IHVwCj4gU1ZRcyBpbiB0aGUgdmhvc3QgZGV2aWNlLgo+Cj4g
SG9zdCBtZW1vcnkgbm90aWZpZXJzIHJlZ2lvbnMgYXJlIGxlZnQgb3V0IGZvciBzaW1wbGljaXR5
LCBhbmQgdGhleSB3aWxsCj4gbm90IGJlIGFkZHJlc3NlZCBpbiB0aGlzIHNlcmllcy4KCgpJIHdv
bmRlciBpZiBpdCdzIGJldHRlciB0byBzcXVhc2ggdGhpcyBpbnRvIHBhdGNoIDUgc2luY2UgaXQg
Z2l2ZXMgdXMgYSAKZnVsbCBndWVzdC0+aG9zdCBmb3J3YXJkaW5nLgoKCj4KPiBTaWduZWQtb2Zm
LWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGluY2x1
ZGUvaHcvdmlydGlvL3Zob3N0LXZkcGEuaCB8ICAgNCArKwo+ICAgaHcvdmlydGlvL3Zob3N0LXZk
cGEuYyAgICAgICAgIHwgMTIyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2h3L3ZpcnRpby92aG9zdC12ZHBhLmggYi9pbmNsdWRlL2h3L3Zp
cnRpby92aG9zdC12ZHBhLmgKPiBpbmRleCAzY2U3OWE2NDZkLi4wMDlhOWYzYjZiIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXZkcGEuaAo+ICsrKyBiL2luY2x1ZGUvaHcv
dmlydGlvL3Zob3N0LXZkcGEuaAo+IEBAIC0xMiw2ICsxMiw4IEBACj4gICAjaWZuZGVmIEhXX1ZJ
UlRJT19WSE9TVF9WRFBBX0gKPiAgICNkZWZpbmUgSFdfVklSVElPX1ZIT1NUX1ZEUEFfSAo+ICAg
Cj4gKyNpbmNsdWRlIDxnbW9kdWxlLmg+Cj4gKwo+ICAgI2luY2x1ZGUgImh3L3ZpcnRpby92aXJ0
aW8uaCIKPiAgICNpbmNsdWRlICJzdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3Zob3N0X3R5cGVzLmgi
Cj4gICAKPiBAQCAtMjcsNiArMjksOCBAQCB0eXBlZGVmIHN0cnVjdCB2aG9zdF92ZHBhIHsKPiAg
ICAgICBib29sIGlvdGxiX2JhdGNoX2JlZ2luX3NlbnQ7Cj4gICAgICAgTWVtb3J5TGlzdGVuZXIg
bGlzdGVuZXI7Cj4gICAgICAgc3RydWN0IHZob3N0X3ZkcGFfaW92YV9yYW5nZSBpb3ZhX3Jhbmdl
Owo+ICsgICAgYm9vbCBzaGFkb3dfdnFzX2VuYWJsZWQ7Cj4gKyAgICBHUHRyQXJyYXkgKnNoYWRv
d192cXM7Cj4gICAgICAgc3RydWN0IHZob3N0X2RldiAqZGV2Owo+ICAgICAgIFZob3N0VkRQQUhv
c3ROb3RpZmllciBub3RpZmllcltWSVJUSU9fUVVFVUVfTUFYXTsKPiAgIH0gVmhvc3RWRFBBOwo+
IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmhvc3QtdmRwYS5jIGIvaHcvdmlydGlvL3Zob3N0LXZk
cGEuYwo+IGluZGV4IDZjMTBhN2YwNWYuLjE4ZGUxNGYwZmIgMTAwNjQ0Cj4gLS0tIGEvaHcvdmly
dGlvL3Zob3N0LXZkcGEuYwo+ICsrKyBiL2h3L3ZpcnRpby92aG9zdC12ZHBhLmMKPiBAQCAtMTcs
MTIgKzE3LDE0IEBACj4gICAjaW5jbHVkZSAiaHcvdmlydGlvL3Zob3N0LmgiCj4gICAjaW5jbHVk
ZSAiaHcvdmlydGlvL3Zob3N0LWJhY2tlbmQuaCIKPiAgICNpbmNsdWRlICJody92aXJ0aW8vdmly
dGlvLW5ldC5oIgo+ICsjaW5jbHVkZSAiaHcvdmlydGlvL3Zob3N0LXNoYWRvdy12aXJ0cXVldWUu
aCIKPiAgICNpbmNsdWRlICJody92aXJ0aW8vdmhvc3QtdmRwYS5oIgo+ICAgI2luY2x1ZGUgImV4
ZWMvYWRkcmVzcy1zcGFjZXMuaCIKPiAgICNpbmNsdWRlICJxZW11L21haW4tbG9vcC5oIgo+ICAg
I2luY2x1ZGUgImNwdS5oIgo+ICAgI2luY2x1ZGUgInRyYWNlLmgiCj4gICAjaW5jbHVkZSAicWVt
dS1jb21tb24uaCIKPiArI2luY2x1ZGUgInFhcGkvZXJyb3IuaCIKPiAgIAo+ICAgLyoKPiAgICAq
IFJldHVybiBvbmUgcGFzdCB0aGUgZW5kIG9mIHRoZSBlbmQgb2Ygc2VjdGlvbi4gQmUgY2FyZWZ1
bCB3aXRoIHVpbnQ2NF90Cj4gQEAgLTQwOSw4ICs0MTEsMTQgQEAgZXJyOgo+ICAgCj4gICBzdGF0
aWMgdm9pZCB2aG9zdF92ZHBhX2hvc3Rfbm90aWZpZXJzX2luaXQoc3RydWN0IHZob3N0X2RldiAq
ZGV2KQo+ICAgewo+ICsgICAgc3RydWN0IHZob3N0X3ZkcGEgKnYgPSBkZXYtPm9wYXF1ZTsKPiAg
ICAgICBpbnQgaTsKPiAgIAo+ICsgICAgaWYgKHYtPnNoYWRvd192cXNfZW5hYmxlZCkgewo+ICsg
ICAgICAgIC8qIFNWUSBpcyBub3QgY29tcGF0aWJsZSB3aXRoIGhvc3Qgbm90aWZpZXJzIG1yICov
CgoKSSBndWVzcyB0aGVyZSBzaG91bGQgYmUgYSBUT0RPIG9yIEZJWE1FIGhlcmUuCgoKPiArICAg
ICAgICByZXR1cm47Cj4gKyAgICB9Cj4gKwo+ICAgICAgIGZvciAoaSA9IGRldi0+dnFfaW5kZXg7
IGkgPCBkZXYtPnZxX2luZGV4ICsgZGV2LT5udnFzOyBpKyspIHsKPiAgICAgICAgICAgaWYgKHZo
b3N0X3ZkcGFfaG9zdF9ub3RpZmllcl9pbml0KGRldiwgaSkpIHsKPiAgICAgICAgICAgICAgIGdv
dG8gZXJyOwo+IEBAIC00MjQsNiArNDMyLDE3IEBAIGVycjoKPiAgICAgICByZXR1cm47Cj4gICB9
Cj4gICAKPiArc3RhdGljIHZvaWQgdmhvc3RfdmRwYV9zdnFfY2xlYW51cChzdHJ1Y3Qgdmhvc3Rf
ZGV2ICpkZXYpCj4gK3sKPiArICAgIHN0cnVjdCB2aG9zdF92ZHBhICp2ID0gZGV2LT5vcGFxdWU7
Cj4gKyAgICBzaXplX3QgaWR4Owo+ICsKPiArICAgIGZvciAoaWR4ID0gMDsgaWR4IDwgdi0+c2hh
ZG93X3Zxcy0+bGVuOyArK2lkeCkgewo+ICsgICAgICAgIHZob3N0X3N2cV9zdG9wKGdfcHRyX2Fy
cmF5X2luZGV4KHYtPnNoYWRvd192cXMsIGlkeCkpOwo+ICsgICAgfQo+ICsgICAgZ19wdHJfYXJy
YXlfZnJlZSh2LT5zaGFkb3dfdnFzLCB0cnVlKTsKPiArfQo+ICsKPiAgIHN0YXRpYyBpbnQgdmhv
c3RfdmRwYV9jbGVhbnVwKHN0cnVjdCB2aG9zdF9kZXYgKmRldikKPiAgIHsKPiAgICAgICBzdHJ1
Y3Qgdmhvc3RfdmRwYSAqdjsKPiBAQCAtNDMyLDYgKzQ1MSw3IEBAIHN0YXRpYyBpbnQgdmhvc3Rf
dmRwYV9jbGVhbnVwKHN0cnVjdCB2aG9zdF9kZXYgKmRldikKPiAgICAgICB0cmFjZV92aG9zdF92
ZHBhX2NsZWFudXAoZGV2LCB2KTsKPiAgICAgICB2aG9zdF92ZHBhX2hvc3Rfbm90aWZpZXJzX3Vu
aW5pdChkZXYsIGRldi0+bnZxcyk7Cj4gICAgICAgbWVtb3J5X2xpc3RlbmVyX3VucmVnaXN0ZXIo
JnYtPmxpc3RlbmVyKTsKPiArICAgIHZob3N0X3ZkcGFfc3ZxX2NsZWFudXAoZGV2KTsKPiAgIAo+
ICAgICAgIGRldi0+b3BhcXVlID0gTlVMTDsKPiAgICAgICByYW1fYmxvY2tfZGlzY2FyZF9kaXNh
YmxlKGZhbHNlKTsKPiBAQCAtNTA3LDkgKzUyNywxNSBAQCBzdGF0aWMgaW50IHZob3N0X3ZkcGFf
Z2V0X2RldmljZV9pZChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4gICAKPiAgIHN0YXRpYyBpbnQg
dmhvc3RfdmRwYV9yZXNldF9kZXZpY2Uoc3RydWN0IHZob3N0X2RldiAqZGV2KQo+ICAgewo+ICsg
ICAgc3RydWN0IHZob3N0X3ZkcGEgKnYgPSBkZXYtPm9wYXF1ZTsKPiAgICAgICBpbnQgcmV0Owo+
ICAgICAgIHVpbnQ4X3Qgc3RhdHVzID0gMDsKPiAgIAo+ICsgICAgZm9yICh1bnNpZ25lZCBpID0g
MDsgaSA8IHYtPnNoYWRvd192cXMtPmxlbjsgKytpKSB7Cj4gKyAgICAgICAgVmhvc3RTaGFkb3dW
aXJ0cXVldWUgKnN2cSA9IGdfcHRyX2FycmF5X2luZGV4KHYtPnNoYWRvd192cXMsIGkpOwo+ICsg
ICAgICAgIHZob3N0X3N2cV9zdG9wKHN2cSk7Cj4gKyAgICB9Cj4gKwo+ICAgICAgIHJldCA9IHZo
b3N0X3ZkcGFfY2FsbChkZXYsIFZIT1NUX1ZEUEFfU0VUX1NUQVRVUywgJnN0YXR1cyk7Cj4gICAg
ICAgdHJhY2Vfdmhvc3RfdmRwYV9yZXNldF9kZXZpY2UoZGV2LCBzdGF0dXMpOwo+ICAgICAgIHJl
dHVybiByZXQ7Cj4gQEAgLTYzOSwxMyArNjY1LDI4IEBAIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9n
ZXRfdnJpbmdfYmFzZShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4gICAgICAgcmV0dXJuIHJldDsK
PiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IHZob3N0X3ZkcGFfc2V0X3ZyaW5nX2tpY2soc3RydWN0
IHZob3N0X2RldiAqZGV2LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qgdmhvc3RfdnJpbmdfZmlsZSAqZmlsZSkKPiArc3RhdGljIGludCB2aG9zdF92ZHBh
X3NldF92cmluZ19kZXZfa2ljayhzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZob3N0X3ZyaW5nX2ZpbGUgKmZp
bGUpCj4gICB7Cj4gICAgICAgdHJhY2Vfdmhvc3RfdmRwYV9zZXRfdnJpbmdfa2ljayhkZXYsIGZp
bGUtPmluZGV4LCBmaWxlLT5mZCk7Cj4gICAgICAgcmV0dXJuIHZob3N0X3ZkcGFfY2FsbChkZXYs
IFZIT1NUX1NFVF9WUklOR19LSUNLLCBmaWxlKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IHZo
b3N0X3ZkcGFfc2V0X3ZyaW5nX2tpY2soc3RydWN0IHZob3N0X2RldiAqZGV2LAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdmhvc3RfdnJpbmdfZmlsZSAq
ZmlsZSkKPiArewo+ICsgICAgc3RydWN0IHZob3N0X3ZkcGEgKnYgPSBkZXYtPm9wYXF1ZTsKPiAr
ICAgIGludCB2ZHBhX2lkeCA9IHZob3N0X3ZkcGFfZ2V0X3ZxX2luZGV4KGRldiwgZmlsZS0+aW5k
ZXgpOwo+ICsKPiArICAgIGlmICh2LT5zaGFkb3dfdnFzX2VuYWJsZWQpIHsKPiArICAgICAgICBW
aG9zdFNoYWRvd1ZpcnRxdWV1ZSAqc3ZxID0gZ19wdHJfYXJyYXlfaW5kZXgodi0+c2hhZG93X3Zx
cywgdmRwYV9pZHgpOwo+ICsgICAgICAgIHZob3N0X3N2cV9zZXRfc3ZxX2tpY2tfZmQoc3ZxLCBm
aWxlLT5mZCk7Cj4gKyAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICB9IGVsc2Ugewo+ICsgICAgICAg
IHJldHVybiB2aG9zdF92ZHBhX3NldF92cmluZ19kZXZfa2ljayhkZXYsIGZpbGUpOwo+ICsgICAg
fQo+ICt9Cj4gKwo+ICAgc3RhdGljIGludCB2aG9zdF92ZHBhX3NldF92cmluZ19jYWxsKHN0cnVj
dCB2aG9zdF9kZXYgKmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCB2aG9zdF92cmluZ19maWxlICpmaWxlKQo+ICAgewo+IEBAIC02NTMsNiArNjk0
LDMzIEBAIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9zZXRfdnJpbmdfY2FsbChzdHJ1Y3Qgdmhvc3Rf
ZGV2ICpkZXYsCj4gICAgICAgcmV0dXJuIHZob3N0X3ZkcGFfY2FsbChkZXYsIFZIT1NUX1NFVF9W
UklOR19DQUxMLCBmaWxlKTsKPiAgIH0KPiAgIAo+ICsvKioKPiArICogU2V0IHNoYWRvdyB2aXJ0
cXVldWUgZGVzY3JpcHRvcnMgdG8gdGhlIGRldmljZQo+ICsgKgo+ICsgKiBAZGV2ICAgVGhlIHZo
b3N0IGRldmljZSBtb2RlbAo+ICsgKiBAc3ZxICAgVGhlIHNoYWRvdyB2aXJ0cXVldWUKPiArICog
QGlkeCAgIFRoZSBpbmRleCBvZiB0aGUgdmlydHF1ZXVlIGluIHRoZSB2aG9zdCBkZXZpY2UKPiAr
ICovCj4gK3N0YXRpYyBib29sIHZob3N0X3ZkcGFfc3ZxX3NldHVwKHN0cnVjdCB2aG9zdF9kZXYg
KmRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWaG9zdFNoYWRvd1ZpcnRx
dWV1ZSAqc3ZxLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlk
eCkKPiArewo+ICsgICAgc3RydWN0IHZob3N0X3ZyaW5nX2ZpbGUgZmlsZSA9IHsKPiArICAgICAg
ICAuaW5kZXggPSBkZXYtPnZxX2luZGV4ICsgaWR4LAo+ICsgICAgfTsKPiArICAgIGNvbnN0IEV2
ZW50Tm90aWZpZXIgKmV2ZW50X25vdGlmaWVyOwo+ICsgICAgaW50IHI7Cj4gKwo+ICsgICAgZXZl
bnRfbm90aWZpZXIgPSB2aG9zdF9zdnFfZ2V0X2Rldl9raWNrX25vdGlmaWVyKHN2cSk7CgoKQSBx
dWVzdGlvbiwgYW55IHJlYXNvbiBmb3IgbWFraW5nIFZob3N0U2hhZG93VmlydHF1ZXVlIHByaXZh
dGU/IElmIHdlIApleHBvcnQgaXQgaW4gLmggd2UgZG9uJ3QgbmVlZCBoZWxwZXIgdG8gYWNjZXNz
IGl0cyBtZW1iZXIgbGlrZSAKdmhvc3Rfc3ZxX2dldF9kZXZfa2lja19ub3RpZmllcigpLgoKTm90
ZSB0aGF0IHZob3N0X2RldiBpcyBhIHB1YmxpYyBzdHJ1Y3R1cmUuCgoKPiArICAgIGZpbGUuZmQg
PSBldmVudF9ub3RpZmllcl9nZXRfZmQoZXZlbnRfbm90aWZpZXIpOwo+ICsgICAgciA9IHZob3N0
X3ZkcGFfc2V0X3ZyaW5nX2Rldl9raWNrKGRldiwgJmZpbGUpOwo+ICsgICAgaWYgKHVubGlrZWx5
KHIgIT0gMCkpIHsKPiArICAgICAgICBlcnJvcl9yZXBvcnQoIkNhbid0IHNldCBkZXZpY2Uga2lj
ayBmZCAoJWQpIiwgLXIpOwo+ICsgICAgfQoKCkkgd29uZGVyIHdoZXRoZXIgb3Igbm90IHdlIGNh
biBnZW5lcmFsaXplIHRoZSBsb2dpYyBoZXJlIGFuZCAKdmhvc3RfdmRwYV9zZXRfdnJpbmdfa2lj
aygpLiBUaGVyZSdzIG5vdGhpbmcgdmRwYSBzcGVjaWZpYyB1bmxlc3MgdGhlIAp2aG9zdF9vcHMt
PnNldF92cmluZ19raWNrKCkuCgoKPiArCj4gKyAgICByZXR1cm4gciA9PSAwOwo+ICt9Cj4gKwo+
ICAgc3RhdGljIGludCB2aG9zdF92ZHBhX2Rldl9zdGFydChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYs
IGJvb2wgc3RhcnRlZCkKPiAgIHsKPiAgICAgICBzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiA9IGRldi0+
b3BhcXVlOwo+IEBAIC02NjAsNiArNzI4LDEzIEBAIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9kZXZf
c3RhcnQoc3RydWN0IHZob3N0X2RldiAqZGV2LCBib29sIHN0YXJ0ZWQpCj4gICAKPiAgICAgICBp
ZiAoc3RhcnRlZCkgewo+ICAgICAgICAgICB2aG9zdF92ZHBhX2hvc3Rfbm90aWZpZXJzX2luaXQo
ZGV2KTsKPiArICAgICAgICBmb3IgKHVuc2lnbmVkIGkgPSAwOyBpIDwgdi0+c2hhZG93X3Zxcy0+
bGVuOyArK2kpIHsKPiArICAgICAgICAgICAgVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnN2cSA9IGdf
cHRyX2FycmF5X2luZGV4KHYtPnNoYWRvd192cXMsIGkpOwo+ICsgICAgICAgICAgICBib29sIG9r
ID0gdmhvc3RfdmRwYV9zdnFfc2V0dXAoZGV2LCBzdnEsIGkpOwo+ICsgICAgICAgICAgICBpZiAo
dW5saWtlbHkoIW9rKSkgewo+ICsgICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+ICsgICAgICAg
ICAgICB9Cj4gKyAgICAgICAgfQo+ICAgICAgICAgICB2aG9zdF92ZHBhX3NldF92cmluZ19yZWFk
eShkZXYpOwo+ICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgIHZob3N0X3ZkcGFfaG9zdF9ub3Rp
ZmllcnNfdW5pbml0KGRldiwgZGV2LT5udnFzKTsKPiBAQCAtNzM3LDYgKzgxMiw0MSBAQCBzdGF0
aWMgYm9vbCAgdmhvc3RfdmRwYV9mb3JjZV9pb21tdShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYpCj4g
ICAgICAgcmV0dXJuIHRydWU7Cj4gICB9Cj4gICAKPiArLyoqCj4gKyAqIEFkYXB0b3IgZnVuY3Rp
b24gdG8gZnJlZSBzaGFkb3cgdmlydHF1ZXVlIHRocm91Z2ggZ3BvaW50ZXIKPiArICoKPiArICog
QHN2cSAgIFRoZSBTaGFkb3cgVmlydHF1ZXVlCj4gKyAqLwo+ICtzdGF0aWMgdm9pZCB2aG9zdF9w
c3ZxX2ZyZWUoZ3BvaW50ZXIgc3ZxKQo+ICt7Cj4gKyAgICB2aG9zdF9zdnFfZnJlZShzdnEpOwo+
ICt9CgoKQW55IHJlYXNvbiBmb3Igc3VjaCBpbmRpcmVjdGlvbj8gQ2FuIHdlIHNpbXBseSB1c2Ug
dmhvc3Rfc3ZxX2ZyZWUoKT8KClRoYW5rcwoKCj4gKwo+ICtzdGF0aWMgaW50IHZob3N0X3ZkcGFf
aW5pdF9zdnEoc3RydWN0IHZob3N0X2RldiAqaGRldiwgc3RydWN0IHZob3N0X3ZkcGEgKnYsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFcnJvciAqKmVycnApCj4gK3sKPiArICAg
IHNpemVfdCBuX3N2cXMgPSB2LT5zaGFkb3dfdnFzX2VuYWJsZWQgPyBoZGV2LT5udnFzIDogMDsK
PiArICAgIGdfYXV0b3B0cihHUHRyQXJyYXkpIHNoYWRvd192cXMgPSBnX3B0cl9hcnJheV9uZXdf
ZnVsbChuX3N2cXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdmhvc3RfcHN2cV9mcmVlKTsKPiArICAgIGlmICghdi0+c2hhZG93
X3Zxc19lbmFibGVkKSB7Cj4gKyAgICAgICAgZ290byBvdXQ7Cj4gKyAgICB9Cj4gKwo+ICsgICAg
Zm9yICh1bnNpZ25lZCBuID0gMDsgbiA8IGhkZXYtPm52cXM7ICsrbikgewo+ICsgICAgICAgIFZo
b3N0U2hhZG93VmlydHF1ZXVlICpzdnEgPSB2aG9zdF9zdnFfbmV3KCk7Cj4gKwo+ICsgICAgICAg
IGlmICh1bmxpa2VseSghc3ZxKSkgewo+ICsgICAgICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJD
YW5ub3QgY3JlYXRlIHN2cSAldSIsIG4pOwo+ICsgICAgICAgICAgICByZXR1cm4gLTE7Cj4gKyAg
ICAgICAgfQo+ICsgICAgICAgIGdfcHRyX2FycmF5X2FkZCh2LT5zaGFkb3dfdnFzLCBzdnEpOwo+
ICsgICAgfQo+ICsKPiArb3V0Ogo+ICsgICAgdi0+c2hhZG93X3ZxcyA9IGdfc3RlYWxfcG9pbnRl
cigmc2hhZG93X3Zxcyk7Cj4gKyAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgIHN0YXRpYyBpbnQg
dmhvc3RfdmRwYV9pbml0KHN0cnVjdCB2aG9zdF9kZXYgKmRldiwgdm9pZCAqb3BhcXVlLCBFcnJv
ciAqKmVycnApCj4gICB7Cj4gICAgICAgc3RydWN0IHZob3N0X3ZkcGEgKnY7Cj4gQEAgLTc1OSw2
ICs4NjksMTAgQEAgc3RhdGljIGludCB2aG9zdF92ZHBhX2luaXQoc3RydWN0IHZob3N0X2RldiAq
ZGV2LCB2b2lkICpvcGFxdWUsIEVycm9yICoqZXJycCkKPiAgICAgICBkZXYtPm9wYXF1ZSA9ICBv
cGFxdWUgOwo+ICAgICAgIHYtPmxpc3RlbmVyID0gdmhvc3RfdmRwYV9tZW1vcnlfbGlzdGVuZXI7
Cj4gICAgICAgdi0+bXNnX3R5cGUgPSBWSE9TVF9JT1RMQl9NU0dfVjI7Cj4gKyAgICByZXQgPSB2
aG9zdF92ZHBhX2luaXRfc3ZxKGRldiwgdiwgZXJycCk7Cj4gKyAgICBpZiAocmV0KSB7Cj4gKyAg
ICAgICAgZ290byBlcnI7Cj4gKyAgICB9Cj4gICAKPiAgICAgICB2aG9zdF92ZHBhX2dldF9pb3Zh
X3JhbmdlKHYpOwo+ICAgCj4gQEAgLTc3MCw2ICs4ODQsMTAgQEAgc3RhdGljIGludCB2aG9zdF92
ZHBhX2luaXQoc3RydWN0IHZob3N0X2RldiAqZGV2LCB2b2lkICpvcGFxdWUsIEVycm9yICoqZXJy
cCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWSVJUSU9fQ09ORklHX1NfRFJJ
VkVSKTsKPiAgIAo+ICAgICAgIHJldHVybiAwOwo+ICsKPiArZXJyOgo+ICsgICAgcmFtX2Jsb2Nr
X2Rpc2NhcmRfZGlzYWJsZShmYWxzZSk7Cj4gKyAgICByZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4g
ICBjb25zdCBWaG9zdE9wcyB2ZHBhX29wcyA9IHsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
