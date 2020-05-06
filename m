Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A031C6AE9
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 10:08:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9F37224B78;
	Wed,  6 May 2020 08:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogElfoFz-b5D; Wed,  6 May 2020 08:08:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D216924B59;
	Wed,  6 May 2020 08:08:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4524C0859;
	Wed,  6 May 2020 08:08:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36FF2C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2D1BF885C6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUOMDxs-KQ1e
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:08:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C22FC8854C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588752513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=CBWxp/RqrAZHRhIdtBhb3xri0XLzwh+Ch7QU+ftNF34=;
 b=X5aij9Dcg2c93UiXjCx3F/VgGLUlK7pOUCYpH/bYM3QYiDkBSGh0H+oceIGQiF7O03vaEV
 tAM8Jk8uRuPne4OoGVMRylpzKyTsqwfgTWG3njDnYngWMNqaZ2x5ZG5UaL+8YXkyqaIw5v
 GGwZCsCSe+cvN9YtNFcYgdbqxo+4S5M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-sZx8yJ7yOMiOhV_bS13HrQ-1; Wed, 06 May 2020 04:08:32 -0400
X-MC-Unique: sZx8yJ7yOMiOhV_bS13HrQ-1
Received: by mail-wr1-f71.google.com with SMTP id e5so891283wrs.23
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 01:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=CBWxp/RqrAZHRhIdtBhb3xri0XLzwh+Ch7QU+ftNF34=;
 b=Jcfw41igl8ncFqkF/uxatNPig0j/28ayzJy7YOYKsoqK4QT5GfNCBHzMNYLGLne+EU
 HYU1tPyL15g4Dxo+jQ+eodxdc0W/iUT/AWRRgogXSeCDnZL5FLeqlhxdnmaBeHLd/P8+
 VP0WAJIJ8j/aQOt5pRC6inwaO4dGBIIbsBcoK3F5hwmQQNIs7db9tZmoVteoIDmc8nSF
 MPslF+9GPEHwhuYVhmlby1FJ6wTyXB0HgOtKNWs6O4Ffm0IQn4iUATXfjgH/Y3g5ICCh
 UjOl/+/ClTP8vqaMTbdYDEDB/Bzn23XDRfsyHeRi8urAS8WFbaBcebPY/lYAt4ROujT8
 x1DQ==
X-Gm-Message-State: AGi0PuZ6W0pWHEUki+LlncXHgkJ5soAVCxSEiq1Q8Vtt9nbGBLJOMBQ5
 CrYLt02sZS5PnYE7w4yLM3evXEoovDYFsGwvyEuFxsJVAelALfqW4Oenc1d6XdrjUls9Jl1M0Nq
 xic9cMvGfuMNnZvKYmnC3+oYNxqxS0yzfKAp4tQIj5g==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr8713637wrv.73.1588752511066;
 Wed, 06 May 2020 01:08:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypKoYFzRFdcs5OUqDOntDuXyJrKD5k/C6ihqMqcjU/DctdS4/KReL94LfbKFGzcZw7Aen1K6xw==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr8713617wrv.73.1588752510881;
 Wed, 06 May 2020 01:08:30 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 g25sm1724902wmh.24.2020.05.06.01.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 01:08:30 -0700 (PDT)
Date: Wed, 6 May 2020 04:08:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: performance bug in virtio net xdp
Message-ID: <20200506035704-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>, bpf@vger.kernel.org
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

So for mergeable bufs, we use ewma machinery to guess the correct buffer
size. If we don't guess correctly, XDP has to do aggressive copies.

Problem is, xdp paths do not update the ewma at all, except
sometimes with XDP_PASS. So whatever we happen to have
before we attach XDP, will mostly stay around.

The fix is probably to update ewma unconditionally.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
